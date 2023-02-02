#!/bin/bash
url=https://google.com
curl ${url} -I -o headers -s
cat headers 