---
title: Vapor 4 with Tibor Bödecs
date: 2020-05-20 00:00
description: In this episode, Leo talks with Tibor Bödecs about Vapor 4 and his new
  book Practical Server-Side Swift. We talk about why someone may choose Vapor and
  the updates made in Vapor 4 from the Database Models and OS Support.
featuredImage: https://images.transistor.fm/file/transistor/images/episode/251313/full_1589892290-artwork.jpg
youtubeID: KIYDue87wZw
audioDuration: 2956
videoDuration: 2958
transistorID: 17f05dbf
---
<p><b>Guest</b></p><ul><li>
<a href="https://t.co/w9s0Xj5sKK?amp=1"><strong>Tibor Bödecs</strong> (website)</a><ul>
<li><a href="https://theswiftdev.com"><strong>The Swift Dev Blog - theswiftdev.com</strong></a></li>
<li><a href="https://twitter.com/tiborbodecs">Twitter @tiborbodecs</a></li>
<li><a href="https://gumroad.com/l/practical-server-side-swift/5uwzmqq"><strong>Practical Server-Side Swift</strong></a></li>
</ul>
</li></ul><p><b><a href="https://brightdigit.typeform.com/to/FwbXt4">Take The Survey! 🙏</a></b></p><p><a href="https://brightdigit.typeform.com/to/FwbXt4">https://brightdigit.typeform.com/to/FwbXt4</a></p><p><strong>50th Episode - Q&amp;A - submit your questions to me @leogdion with hashtag #empowerapps</strong></p><p><b>Related Episodes</b></p><ul>
<li><a href="https://share.transistor.fm/s/ffcb9fc1"><strong>Episode 8: Cloud and Backend Services For Apps</strong></a></li>
<li><a href="https://share.transistor.fm/s/bf0516f2"><strong>Episode 34: Server-Side Swift with Tim Condon</strong></a></li>
<li><a href="https://share.transistor.fm/s/fca974ca"><strong>Episode 48: Alternative Backends with Kristaps Grinbergs</strong></a></li>
</ul><p><b>Related Links</b></p><ul>
<li><a href="https://vapor.codes">Vapor.Codes</a></li>
<li><a href="https://docs.vapor.codes/4.0/">Vapor 4 Docs</a></li>
<li><a href="https://discord.gg/vapor">Vapor Discord</a></li>
<li>
<a href="https://heartwitch.app/">Heartwitch - Uses Vapor WebSockets</a> </li>
<li><a href="https://developer.apple.com/wwdc20/"><strong>WWDC 2020 is happening!</strong></a></li>
<li><a href="https://github.com/apple/swift-argument-parser">Swift ArgumentParser</a></li>
<li><a href="https://theswiftdev.com/whats-new-in-vapor-4/">Tibor Bödecs - What's New in Vapor 4?</a></li>
<li><a href="https://theswiftdev.com/whats-new-in-swift-5-3/">Tibor Bödecs - What’s new in Swift 5.3?</a></li>
<li><a href="https://www.timc.dev/posts/future-of-server-side-swift/">Tim Condon - The Future of Swift on the Server</a></li>
<li><a href="https://swift.org/blog/5-3-release-process/">Swift 5.3 Release Process and OS Support</a></li>
<li><a href="https://learningswift.brightdigit.com/vapor-heroku-ubuntu-setup-deploy/">Leo's setup article for Vapor 3</a></li>
</ul><p><b>Sponsors</b></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>There's a lot of demand for apps right now, so it's a really great time to give it a try. It's easier than you think.<br>The guys who run it are indie devs who had a need and created a tool. 11 years later, it's an all-in-one platform for developers who want to get more downloads and make more money with their apps.</p><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><a href="http://www.audibletrial.com/EmpowerApps"><strong>Audible</strong></a><strong><br></strong>Audible is the leading provider of spoken-word entertainment and audiobooks, ranging from best sellers, to celebrity memoirs, news, business, and self-development. Every month, members get one (1) credit to pick any title, plus two (2) Audible Originals from a monthly selection, and access to daily news digests (from <em>The New York Times, The Wall Street Journal, and The Washington Post</em>), as well as guided meditation programs.</p><p><em>My recommendation</em><br><strong>Talking to Strangers - What We Should Know About the People We Don't Know</strong></p><p>Written and Narrated by: <strong>Malcolm Gladwell</strong></p><p><br>Try it out today and 2 free audiobooks:<br><a href="http://www.audibletrial.com/EmpowerApps">http://www.audibletrial.com/EmpowerApps</a></p><p><b>WWDC 2020?</b></p><ul>
<li>What are you most excited about?</li>
<li>Will there be new hardware or IDE?</li>
</ul><p><b>Vapor 4 Changes</b></p><ul>
<li>Updates to the Command API</li>
<li>New Service Layer</li>
<li>Updates with HTTP 2 with SwiftNIO 2</li>
<li>How SwiftNIO2 does Futures and Promises</li>
<li>Using PropertyWrappers with Fluent ORM</li>
<li>Making Swift Package Manager work with you</li>
</ul><p><b>Getting Started with Vapor</b></p><ul>
<li>Requires Linux or macOS with Swift 5.2</li>
<li>Recent Support for Ubuntu 20, Amazon Linux, CentOS</li>
<li>Using Vapor Toolbox vs just SPM</li>
<li>Unit Testing with Separate Package </li>
<li>Structure of the App</li>
<li>Getting Your Database Models Setup</li>
<li>Using Push Notifications on Vapor and Sign-In With Apple</li>
<li>Why Should You Consider Vapor?</li>
<li>Where to Host Your App?</li>
</ul><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com</p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><br></p><p><br></p><p><strong><a href="https://www.patreon.com/empowerappsshow" rel="payment" title="★ Support this podcast on Patreon ★">★ Support this podcast on Patreon ★</a></strong></p>
      