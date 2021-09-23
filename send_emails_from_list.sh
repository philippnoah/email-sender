#!/bin/bash

while read p; do
  osascript send_email.scpt $p
done <$1
