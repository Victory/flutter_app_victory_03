#!/bin/bash

flutter pub run intl_translation:extract_to_arb --output-dir lib/locale/ lib/locale/app_local.dart
awk -i inplace 'NR==1{print; print "  \"@@locale\": \"en\","} NR!=1' lib/locale/intl_messages.arb
flutter pub run intl_translation:generate_from_arb --output-dir lib/locale/ lib/locale/app_local.dart lib/locale/*.arb
