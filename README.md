## Workflowit

A contrived example of a step based workflow in Rails. Uses a single controller
with two actions for the entire workflow.

### RVM

Contains a project .rvmrc with gemset 1.9.3-p0-falcon@workflowit. You may want
to modify this after cloning.

### Setup

    git clone git://github.com/supaspoida/workflowit.git
    cd workflowit
    bundle
    rails s

### Usage

Visit http://localhost:3000 and answer the questions correctly to progress.
Some basic math required. Code is commented to (hopefully) explain workflow
pattern.
