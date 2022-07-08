#!/bin/sh

cd example
flutter build web --web-renderer canvaskit
firebase deploy --only hosting:mono-kit
