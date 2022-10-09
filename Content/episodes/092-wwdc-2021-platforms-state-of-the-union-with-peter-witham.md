---
title: WWDC 2021 - Platforms State of the Union with Peter Witham
date: 2021-06-08 15:09
description: 'In this episode, Leo is joined by Peter Witham to discuss the Platforms State of the Union: Xcode Cloud, Async/Await & Actors, Building Apps on the iPad,  Focus & DND, ScreenTime API, Shareplay API and more...'
featuredImage: https://images.transistor.fm/file/transistor/images/episode/562640/full_1623179380-artwork.jpg
youtubeID: 6IEvRlyu904
audioDuration: 5145
videoDuration: 5380
podcastID: ace13930
---
<p><b>Guest</b></p><ul><li>
<a href="https://peterwitham.com/">Peter Witham</a> - <a href="https://compileswift.com/">Compileswift.com</a> - <a href="https://twitter.com/CompileSwift">Twitter</a>
</li></ul><p><b>Crossover Episode</b></p><ul><li><a href="https://www.compileswift.com/podcast/s03-e01/"><strong>CompileSwift - Episode - Keynote Review</strong></a></li></ul><p><a href="https://brightdigit.typeform.com/to/yVZN2gIT"><strong>Podcast Survey</strong> - https://brightdigit.typeform.com/to/yVZN2gIT</a><br><a href="https://youtu.be/6IEvRlyu904"><strong>Youtube Video</strong> - https://youtu.be/6IEvRlyu904</a></p><p><b>Related Episodes</b></p><ul>
<li><a href="https://share.transistor.fm/s/a14f868f">Episode 24 - Continuous Integration with Kyle Newsome</a></li>
<li><a href="https://share.transistor.fm/s/593efb15">Episode 81 - Awaiting for Async with Vincent Pradeilles</a></li>
<li><a href="https://share.transistor.fm/s/bab83e8a">Episode 84 - Automation Fun with Jared Sorge</a></li>
<li><a href="https://share.transistor.fm/s/8505d100">Episode 91 - Fastlane with Josh Holtz</a></li>
</ul><p><b>Related Links</b></p><ul>
<li><a href="https://developer.apple.com/xcode-cloud/beta/">Xcode Cloud Beta Signup</a></li>
<li><a href="https://www.apress.com/gp/book/9781484270011">Test-Driven Development in Swift by Gio Lodi</a></li>
<li><a href="https://twitter.com/joshshaffer/status/1402036339105665024?s=20">Josh Shaffer's Clarification on Async/Await and Combine</a></li>
</ul><p><b>Sponsors</b></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>There's a lot of demand for apps right now, so it's a really great time to give it a try. It's easier than you think.<br>The guys who run it are indie devs who had a need and created a tool. 11 years later, it's an all-in-one platform for developers who want to get more downloads and make more money with their apps.</p><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><a href="https://revenuecat.com/"><strong>RevenueCat</strong></a><strong></strong></p><p>Using RevenueCat to power your in-app purchase infrastructure solves:</p><ul>
<li>For edge cases <strong>you don’t even know you have</strong>
</li>
<li>
<strong>Protects from outages</strong> your team hasn’t seen yet</li>
<li>Saves you time on<strong> future maintenance </strong>
</li>
<li>As well as <strong>new features released by the app stores</strong>
</li>
<li>
<strong>Empowers your marketing teams</strong> with clean, reliable IAP data</li>
</ul><p>All that to say, <strong>RevenueCat handles all the headaches of in-app purchases</strong> so you can get back to building your app. Try RevenueCat today at <a href="http://revenuecat.com/">revenuecat.com</a>.</p><p><a href="https://360idev.com/"><strong>360iDev - August 22 -25 (Hybrid)</strong></a></p><ul>
<li>The Leading indie iOS/Mac (and watchOS, and tvOS) Developer conference</li>
<li>It's all about Community and Code!</li>
<li>Four days of hands-on training, amazing sessions, and the great community. All Swift.</li>
<li>Available Online <strong>or </strong>In-Person</li>
</ul><p>Use the promo code <strong>EmpowerApps </strong>to get <a href="https://360idev.com/"><strong>25% off registration.</strong></a></p><p><b>Xcode Cloud</b></p><ul>
<li>How does it differ from Xcode Server and Serverbots?</li>
<li>Is there an on-premises version?</li>
<li>Can the Workflows be edited via web or text?</li>
<li>How does it compare to other services?</li>
<li>Where's the REST API for Xcode Cloud</li>
<li>How much does it cost?</li>
<li>What's is going to be the relationship with Fastlane?</li>
<li>How do pull requests, discussions, etc... interface with Git Repo Services (GitHub, Gitlab)?</li>
</ul><p><b>Xcode... Swift Playgrounds on the iPad</b></p><ul>
<li>Fully Build and Upload Apps from the iPad</li>
<li>How does sharing code with Xcode on the Mac work?</li>
<li>How does it interface with Git Repos?</li>
<li>Can Preview Apps in Full Screen</li>
<li>Sounds perfect for testing and prototyping</li>
</ul><p><b>Async/Await and Actors</b></p><ul>
<li>See episode with Vincent on async and await</li>
<li>Xcode includes tools for refactoring</li>
<li>What's the relationship with Combine?</li>
<li>Uncertainty with Actors</li>
</ul><p><b>SwiftUI - Year 3</b></p><ul>
<li>Used in various macOS apps (Maps, Photos, etc...)</li>
<li>Continued improvements to List</li>
<li>Table added to macOS</li>
<li>Specific Platforms for modifiers</li>
<li>Pull-to-Refresh One liner</li>
<li>New Material Styles and UI Focus API</li>
</ul><p><b>Focus and Notifications</b></p><ul>
<li>More Granular control over notifications</li>
<li>How do notification scores work?</li>
<li>What can we do about notification spam?</li>
</ul><p><b>Widgets</b></p><ul>
<li>New Extra Large Widget</li>
<li>More Stacks</li>
<li>Widget Suggestions</li>
<li>iPad Home Screen Widgets</li>
<li>Peter's rant on Widgets</li>
</ul><p>Also... ScreenTime API, SharePlay API, AR Object Capture, and the death of Objective-C</p><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com<br><a href="https://github.com/brightdigit">GitHub - @brightdigit</a></p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.reddit.com/user/leogdion"><strong>Reddit</strong><br>Leo - /u/leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><br></p><p><strong><a href="https://www.patreon.com/empowerappsshow" rel="payment" title="★ Support this podcast on Patreon ★">★ Support this podcast on Patreon ★</a></strong></p>
      
