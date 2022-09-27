/*
 * Diff Match and Patch
 *
 * Copyright 2011 geheimwerk.de.
 * http://code.google.com/p/google-diff-match-patch/
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Author: jan@geheimwerk.de (Jan Weiß)
 */

#import "TestUtilities.h"
#import "JXArcCompatibilityMacros.h"

NSString * diff_stringForFilePath(NSString *aFilePath) {
  NSString *absoluteFilePath;

  // FIXME: This does not work correctly with aliases: the alias file itself is read.
  // We can use the code from here to fix this: 
  // http://cocoawithlove.com/2010/02/resolving-path-containing-mixture-of.html
  if ([aFilePath isAbsolutePath]) {
    absoluteFilePath = aFilePath;
  }
  else {
    absoluteFilePath = [[NSString pathWithComponents:
                         [NSArray arrayWithObjects:
                          [[NSFileManager defaultManager] currentDirectoryPath], 
                          aFilePath, 
                          nil]
                         ] stringByStandardizingPath];
  }
  
  NSURL *aURL = [NSURL fileURLWithPath:absoluteFilePath];
  
  return diff_stringForURL(aURL);
}

NSString * diff_stringForURL(NSURL *aURL) {
  return [NSString stringWithContentsOfURL:aURL encoding:NSUTF8StringEncoding error:nil];
}
