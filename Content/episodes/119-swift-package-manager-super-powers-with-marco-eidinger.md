---
title: Swift Package Manager Super Powers with Marco Eidinger
date: 2022-04-05 00:00
description: Leo is joined by Marco Eidinger, Swift iOS SDK architect at SAP. We talk about some of the challenges and tips for working with Swift Package Manager in Xcode and with SwiftUI.
featuredImage: https://images.transistor.fm/file/transistor/images/episode/839152/full_1648157326-artwork.jpg
youtubeID: QY0TPCHXMWA
audioDuration: 2663
videoDuration: 2973
podcastID: 3643e409
---
<p><b>Guest</b></p><ul><li>
<a href="https://blog.eidinger.info"><strong>Marco Eidinger</strong> (website)</a><ul>
<li><a href="https://twitter.com/MarcoEidinger">Twitter (@MarcoEidinger)</a></li>
<li><a href="https://www.iosdevupdates.com">iOS Dev Updates</a></li>
</ul>
</li></ul><p><a href="https://youtu.be/QY0TPCHXMWA"><strong>Youtube Video</strong> - https://youtu.be/QY0TPCHXMWA</a></p><p><b>Related Episodes</b></p><ul>
<li><a href="https://share.transistor.fm/s/e6621ded">Episode 77 - Swift Package Index with Sven A. Schmidt</a></li>
<li><a href="https://share.transistor.fm/s/e38854fe">Episode 46 - Developer Community (Part 2) with Dave Verwer</a></li>
<li><a href="https://share.transistor.fm/s/46b2f52d">Episode 45 - Developer Community (Part 1) with Dave Verwer</a></li>
</ul><p><b>Related Links</b></p><ul>
<li><a href="https://blog.eidinger.info/swift-package-manager-understand-resolve-reset-and-update">Swift Package Manager: understand resolve, reset and update</a></li>
<li><a href="%20https://blog.eidinger.info/xcode-133-supports-spm-binary-dependency-in-private-github-release%20">Xcode 13.3 supports SPM binary dependency in private GitHub release</a></li>
<li><a href="https://blog.eidinger.info/localized-swiftui-views-in-a-swift-package">Localized SwiftUI Views in a Swift Package</a></li>
<li><a href="https://blog.eidinger.info/integrate-a-complex-swift-package-into-your-ios-app%20">Integrate a complex Swift Package into your iOS app</a></li>
<li><a href="https://blog.eidinger.info/automate-the-way-you-keep-up-with-dependency-changes-in-your-swift-package%20">Automate the way you keep up with dependency changes in your Swift Package</a></li>
<li><a href="https://blog.eidinger.info/the-best-registries-for-your-swift-package%20">The best registries for your Swift Package</a></li>
<li><a href="https://blog.eidinger.info/use-swift-package-manager-in-your-own-swift-package">Use Swift Package Manager in your own Swift Package</a></li>
<li><a href="https://github.com/marketplace/actions/swift-package-dependencies-check">Swift Package Dependencies Checker - Github Action<em>  </em></a></li>
</ul><p><b>Sponsors</b></p><p><a href="http://sentry.io/for/ios?utm_source=empowerapps&amp;utm_medium=paid-podcast"><strong>Sentry</strong></a><strong><br></strong>From error tracking to performance monitoring, developers can see what actually matters, solve quicker, and learn continuously about their applications - from the frontend to the backend.</p><ul>
<li>Source code, error filters, stack locals — Sentry enhances application performance monitoring with stack traces.</li>
<li>Quickly identify performance issues before they become downtime. </li>
<li>Breadcrumbs make application development a little easier by showing you the trails of events that lead to the error(s).</li>
<li>Real-time application monitoring means data, in real-time. </li>
<li>Dashboards add a visual element to our application monitoring.</li>
</ul><p>Over 1M developers and 80K organizations already ship better software faster with Sentry application monitoring. <br>Check out their great iOS dev docs at:<br><a href="https://docs.sentry.io/platforms/apple/guides/ios?utm_source=empowerapps&amp;utm_medium=paid-podcast">https://docs.sentry.io/platforms/apple/guides/ios?utm_source=empowerapps&amp;utm_medium=paid-podcast</a><br>Sign up today for free at:<br><a href="http://sentry.io/for/ios?utm_source=empowerapps&amp;utm_medium=paid-podcast">http://sentry.io/for/ios?utm_source=empowerapps&amp;utm_medium=paid-podcast</a></p><p><br><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>There's a lot of demand for apps right now, so it's a really great time to give it a try. It's easier than you think.<br>The guys who run it are indie devs who had a need and created a tool. 11 years later, it's an all-in-one platform for developers who want to get more downloads and make more money with their apps.</p><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><b>Show Notes</b></p><ul>
<li>How Swift Package Manager has improved?</li>
<li>Dealing with Binary Dependencies</li>
<li>Plugin Support in Swift 5.6</li>
<li>Xcode Issues</li>
<li>Proper Versioning in SPM</li>
<li>SwiftUI and Localization with SPM</li>
<li>Targets vs Products</li>
<li>Setting up for CI Success</li>
<li>Find Packages for your App</li>
</ul><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com<br><a href="https://github.com/brightdigit">GitHub - @brightdigit</a></p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.reddit.com/user/leogdion"><strong>Reddit</strong><br>Leo - /u/leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><strong><a href="https://www.patreon.com/empowerappsshow" rel="payment" title="★ Support this podcast on Patreon ★">★ Support this podcast on Patreon ★</a></strong></p>
      
