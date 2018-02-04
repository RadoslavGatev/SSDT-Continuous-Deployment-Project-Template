/*
This will be executed during the pre-deployment phase.
Use it to apply scripts for all actions that cannot be easily and 
consistently done using just the database project.

Note that the pre-deployment scripts are just prepended to the
generated script.

!!!Make sure your scripts are idempotent(repeatable)!!!

Example invocation:
EXEC sp_execute_script @sql = 'UPDATE Table....', @author = 'Your Name'
*/

