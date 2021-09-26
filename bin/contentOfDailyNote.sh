#!/bin/bash

cat $1 | sed -n 's:.*\begin{document}\(.*\)\end{document}.*:\1:p'
