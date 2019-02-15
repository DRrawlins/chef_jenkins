# chef-jenkins

## Choices
I decided to use Chef as in the past I had only used ansible and salt purely in the cloud, and chef primarily on premise. And decided I wanted to give myself a challenge. I went with a purely reciped based approach to save time, and decided to write from scratch, we shall see if that was wise.

## Pitfalls
None yet, we shall see how chef-zero holds up to ansible in the cloud when I get to the terraform.
In localdev its all the same.

## Usage
```bash
./install-fed-dependencies.sh
bundle exec kitchen conv
```
