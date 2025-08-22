#!/usr/bin/env python3 

import sys
import os
import qubes
import subprocess

from xdg.DesktopEntry import DesktopEntry
import shlex

def push_option(key,value):
    line = f"\0{key}\x1f{value}\n"
    sys.stdout.buffer.write(line.encode("ascii"))
def push_entry(row,metadata=None):
    line = f"{row}"
    first = True
    if metadata != None:
        for key, value in metadata.items():
            if first:
                line += "\0"
            else:
                line += "\x1f"
            line += f"{key}\x1f{value}"
            first = False
    line += "\n"
    sys.stdout.buffer.write(line.encode("ascii"))
    
def has_feature(vm,feature:str)->bool:
    return len(vm.features.get(feature,""))!=0

def filter_vm(vm)-> bool:
    return  has_feature(vm,"servicevm") or has_feature(vm,"internal") or isinstance(vm, qubes.vm.templatevm.TemplateVM)

def generate_vm_list():
    app = qubes.Qubes()
    return [(vm.name, hasattr(vm,"template_for_dispvms") and vm.template_for_dispvms) for vm in app.domains if not filter_vm(vm)]

def generate_drun(path):
    entries = []
    for file_name in os.listdir(path): 
        if file_name.endswith(".desktop"):
            deskpath = os.path.join(path,file_name)
            deskEntry = DesktopEntry(deskpath)
            entry = {
                "name":deskEntry.getName(),
                "exe":deskEntry.getExec(),
                "icon":deskEntry.getIcon(),
                "meta": ' '.join(deskEntry.getCategories()), # todo: handles spaces
                "DVMTempEntry":deskEntry.hasKey("X-Qubes-DispvmExec"),
            }
            entries.append(entry)
    return entries
def generate_dom0_drun() -> list:
    drun = generate_drun("/usr/share/applications/") 
    return [(e["name"],e["exe"],e["icon"],e["meta"]) for e in drun]
def generate_vm_drun(vm) -> list:
    drun = generate_drun(os.path.expanduser(f"~/.local/share/qubes-appmenus/{vm}/apps/"))
    return [(e["name"],e["exe"],e["icon"],e["meta"]) for e in drun if not e["DVMTempEntry"]]

def main():
    retv = int(os.getenv("ROFI_RETV",0))
    data = os.getenv("ROFI_DATA",None)
    info = os.getenv("ROFI_INFO",None)
    args = sys.argv[1:]
    if retv == 0:
        # Selecting Domain
        entries = generate_vm_list()
        push_option("prompt","Domain")
        push_option("data","[None]")
        push_option("no-custom","true")
        for (vm, disposable) in entries:
            if disposable:
                push_entry(f"{vm} (DispVM)",{"info":"disposable", "display":f"{vm} (DispVM)"})
            else:
                push_entry(vm,{"info":"appvm", "display":f"{vm}"})
        exit(0)
    elif retv == 1 or retv == 2:
        if data == None:
            exit(2) 
        elif data == "[None]":
            domain = args[0]
            # Selecting Within Domain
            if args[0] == "dom0":
                entries = generate_dom0_drun()
                ush_option("prompt","dom0") 
            elif info == "disposable":
                domain = domain.split("(")[0][:-1]
                push_option("prompt",f"{domain} (DispVM)")
                entries = generate_vm_drun(domain)
            else:
                push_option("prompt",domain)
                entries = generate_vm_drun(domain)

            push_option("no-custom","false")
            push_option("data",domain) # Store domain for next use
            for (row, exe, icon, meta) in entries:
                push_entry(row,{"info":exe,"icon":icon,"meta":meta})
            exit(0)
        else:
            # Execute within domain
            domain = data 
            if retv == 1: # Entry was selected
                command = info 
            elif retv == 2:
                command = args[0]
            if command.startswith("!"):
                command = command[1:]
            command = shlex.split(command)
            subprocess.Popen(command,stderr=subprocess.DEVNULL,stdout=subprocess.DEVNULL)
            exit(0)
    exit(1)
if __name__ == "__main__":
    main()
