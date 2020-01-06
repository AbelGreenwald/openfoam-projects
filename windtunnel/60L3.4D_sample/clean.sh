#/bin/bash

rm -rf $(ls| grep -E '(^[^0]$)|([0-9]+.{0,1}[0-9]+)')
