# DevOps Forms Workshop

Note That this workshop is not standalone. You need a database for Forms Application so you have to do the [devopsdb workshop](https://github.com/cpruvost/devopsdb) before.

Sure you need :

- a Forms 12c VM Image in order to be able to be able to build automatically your Forms 12c VM and to be able to deploy you forms application on it. We have already done the job for you but you can sure do your own image on Oracle Cloud Infrastructure (OCI).
- a dump of the Schema of the Forms application. We already have done the job for you with a forms demo application.
- a zip of the Forms application with all the fmb, pll, ... We already have done the job for you with a forms demo application.

Do not hesitate to use it and ask for enhancements if you have any ideas. We will use Developer CS for the pipeline but you can use another solution if you want (Jenkins for ex).

## Table of Contents

1. Create Forms Cloud VM [01-create-forms-vm.md](docs/01-create-forms-vm.md)
2. Import Application Schema in Database [02-import-db-schema.md](docs/02-import-db-schema.md)
3. Compile Forms Application  [03-compile-forms-application.md](docs/03-compile-forms-application.md)
4. Do the configuration of Forms Application  [04-config-forms-application.md](docs/04-config-forms-application.md)
5. Orchestrate all steps in a pipeline  [05-pipeline.md](docs/05-pipeline.md)

