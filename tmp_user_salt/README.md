# Salt Config: user_salt 

In this directory you will find all salt states for the system divided in subdirectories. In the directory itself you can also find top files for groupings of those configurations. 
## Restrictions
### Idempotency 
All states should be idempotent: applying a state multiple times should have the same effect as applying it once.
## Subdirectories
### software
Where the configuration of generic apps are located. Things like neovim, awesome, etc.
### appvms
Where the states to create and configure all appvms are located.
### dispvms
Where the states to create non management disposable templates are located.
### dom0
Where the states that manage dom0 are located.
### services
Where the states for services are located (includes management dispvms).
### standalones
Where the states for standalones are located.
### templates
Where the states for templates are located.
### macros
Some useful jinja macros.
