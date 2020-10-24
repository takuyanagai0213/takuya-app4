#!/bin/bash

rails db:create
reila db:migrate
rails db:seed