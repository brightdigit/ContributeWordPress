---
title: SwiftUI with Majid Jabrayilov - Part 1
date: 2020-07-12 08:00
description: In this two part interview, Leo talks with Majid Jabrayilov about SwiftUI
  one year after its release.  In this first part, we talk about whether it is production
  ready, all the new updates from WWDC 2020, challenges implmenting SwiftUI, as well
  as well it works on all platforms.
featuredImage: https://images.transistor.fm/file/transistor/images/episode/287811/full_1593573940-artwork.jpg
youtubeID: RptJR1VfMGE
audioDuration: 1741
videoDuration: 1743
podcastID: 44dc8297
---
<p><b>Guest</b></p><ul><li>
<a href="https://swiftwithmajid.com"><strong>Majid Jabrayilov</strong></a><ul>
<li><a href="https://swiftwithmajid.com"><strong>SwiftWithMajid.com</strong></a></li>
<li><a href="https://twitter.com/mecid"><strong>Twitter @mecid</strong></a></li>
</ul>
</li></ul><p><b>Related Episodes</b></p><ul>
<li><a href="https://share.transistor.fm/s/51c9a342"><strong>Episode 55 - WWDC 2020 and Xcode 12 with Vadim Shpakovski - Part 2</strong></a></li>
<li><a href="https://share.transistor.fm/s/2c23d28a"><strong>Episode 54 - WWDC 2020 and Xcode 12 with Vadim Shpakovski - Part 1</strong></a></li>
<li><a href="https://share.transistor.fm/s/8f940315"><strong>Episode 53 - WWDC 2020 - Quick Thoughts</strong></a></li>
<li><a href="https://share.transistor.fm/s/8442feb7"><strong>Episode 47 - Practical Combine with Donny Wals</strong></a></li>
<li><a href="https://share.transistor.fm/s/87165d83"><strong>Episode 35 - SwiftUI - The Good, the Bad, and the Benefits</strong></a></li>
<li><a href="https://share.transistor.fm/s/2f12eb02"><strong>Episode 30 - Quickie: Swift UI and 2020 Trends</strong></a></li>
<li><a href="https://share.transistor.fm/s/3051561"><strong>Episode 19 - WWDC 2019 - Swift UI with Jason Anderson</strong></a></li>
</ul><p><b>Related Links</b></p><ul>
<li><a href="https://swiftwithmajid.com/2020/06/23/what-is-new-in-swiftui/">Swift with Majid - <strong>What's new in SwiftUI</strong></a></li>
<li><a href="https://swiftwithmajid.com/2020/07/08/mastering-grids-in-swiftui/">Swift with Majid - <strong>Mastering grids in SwiftUI</strong></a></li>
</ul><p><strong>WWDC Videos - We Loved</strong></p><ul>
<li><a href="https://developer.apple.com/videos/play/wwdc2020/10048/"><strong>Build complications in SwiftUI</strong></a></li>
<li><a href="https://developer.apple.com/videos/play/wwdc2020/10046/"><strong>Create complications for Apple Watch</strong></a></li>
<li><a href="https://developer.apple.com/videos/play/wwdc2020/10037/"><strong>App essentials in SwiftUI</strong></a></li>
<li><a href="https://developer.apple.com/videos/play/wwdc2020/10039/"><strong>Build document-based apps in SwiftUI</strong></a></li>
</ul><p><b>Sponsors</b></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>If you want your app to succeed, there's never been a better time to read up on App Store Optimization and Appfigures provides that for you. </p><ul>
<li>Check out their <a href="https://appfigures.com/resources">great articles and guides on app store optimization </a>
</li>
<li>
<a href="https://appfigures.com/resources/tagged/aso-teardown">Brand new teardowns of specific apps</a>, like <a href="https://appfigures.com/resources/aso/optimization-teardown-spotify">Spotify</a> for instance. </li>
<li>Check out more of their resources at <a href="http://appfigures.com/resources">appfigures.com/resources</a>.</li>
</ul><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><a href="https://360idev.com/"><strong>360iDev - August 16 - 19 (Remote)</strong></a></p><ul>
<li>The Leading indie iOS/Mac (and watchOS, and tvOS) Developer conference</li>
<li>It's all about Community and Code!</li>
<li>Four days of hands-on training, amazing sessions, and the great community. All Swift.</li>
</ul><p>Use the promo code <strong>WeAreSwift </strong>to get <a href="https://360idev.com/"><strong>20% off registration.</strong></a></p><p><b>What's New in SwiftUI</b></p><ul>
<li>More Mature Framework</li>
<li>Used in More New Features</li>
<li>Lazy Stacks</li>
<li>New App Structures</li>
<li>@main App Structure with old UIAppDelegate</li>
<li><a href="https://developer.apple.com/documentation/swiftui/wkextensiondelegateadaptor">YES! Apple Watch doesn't need Storyboards and supports @main</a></li>
<li>Brand New Grids </li>
<li>Do you build for iOS 13 or iOS 14</li>
<li>Widgets and Complications in SwiftUI only</li>
</ul><p><b>SwiftUI - Benefits and Issues</b></p><ul>
<li>Benefits of SwiftUI over UIKit</li>
<li>How Declarative Programming is an Improvement</li>
<li>Limitation of Static Navigation Views</li>
<li>SwiftUI on watchOS</li>
<li>SwiftUI on tvOS</li>
<li>Learning Curve with SwiftUI</li>
</ul><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com<br><a href="https://github.com/brightdigit">GitHub - @brightdigit</a></p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><br></p><p><strong><a href="https://www.patreon.com/empowerappsshow" rel="payment" title="★ Support this podcast on Patreon ★">★ Support this podcast on Patreon ★</a></strong></p>
      
