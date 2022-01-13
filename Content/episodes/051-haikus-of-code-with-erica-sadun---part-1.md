---
title: Haikus of Code with Erica Sadun - Part 1
date: 2020-06-08 10:30
description: In this episode, Leo talks with Erica Sadun about the Swift Argument
  Parser, Graphics Support in Xcode, being a Mac user in general, and more. This is
  the first part of our discussion and will continue in the next episode.
featuredImage: https://images.transistor.fm/file/transistor/images/episode/251315/full_1591378273-artwork.jpg
youtubeID: SeaRbgIkmW4
audioDuration: 1762
videoDuration: 1764
---
<p><b>Guest</b></p><ul><li>
<a href="https://ericasadun.com"><strong>Erica Sadun (website)</strong></a><ul>
<li><a href="https://twitter.com/ericasadun">@ericasadun (Twitter)</a></li>
<li><a href="https://github.com/erica">@erica (GitHub)</a></li>
<li><a href="https://pragprog.com/book/esswift2/swift-style-second-edition"><strong>Swift Style, Second Edition</strong> by Erica Sadun</a></li>
</ul>
</li></ul><p><b>Related Episodes</b></p><ul><li><a href="https://share.transistor.fm/s/4f8b37d3"><strong>Episode 20: WWDC 2019 - Mac Development with Daniel Jalkut</strong></a></li></ul><p><b>Related Links</b></p><ul>
<li><a href="https://www.tryswift.co/world/">try! Swift World</a></li>
<li><a href="https://github.com/apple/swift-argument-parser"><strong>Swift Argument Parser</strong></a></li>
<li><a href="https://github.com/yonaskolb/Mint"><strong>yonaskolb/Mint</strong> (GitHub) - <strong>THE WAY </strong>to install Swift Package Tools</a></li>
<li>
<strong>Erica's Command Line Tools</strong><ul>
<li>
<a href="https://github.com/erica/now"><strong>erica/now </strong>(GitHub) - Times around the world...</a> </li>
<li><a href="https://github.com/erica/remind"><strong>erica/remind </strong>(GitHub) - Schedule a notification-center reminder from the command-line... </a></li>
<li><a href="https://github.com/erica/lns"><strong>erica/lns </strong>(GitHub) - Because no one can remember how to use `ln -s` when it really matters</a></li>
</ul>
</li>
<li>
<strong>Leo's Command Line Tools</strong><ul>
<li><a href="https://github.com/brightdigit/EggSeed"><strong>brightdigit/eggseed</strong> (GitHub) - Command Line Tool for Starting Your Swift Packages with Continuous Integration</a></li>
<li><a href="https://github.com/brightdigit/AssetLib"><strong>brightdigit/AssetLib</strong> (GitHub) - Create and Build Asset Catalog and Templates</a></li>
<li><a href="https://github.com/SwiftPackageIndex/PackageListValidator"><strong>SwiftPackageIndex/PackageListValidator</strong> (GitHub) - A tool for validating the Swift Package Index package list</a></li>
</ul>
</li>
<li>HomeBrew Stuff (for Swift Packages - <a href="https://github.com/yonaskolb/Mint">See Mint</a>)<ul>
<li>
<a href="https://brew.sh">HomeBrew Home Page</a> </li>
<li><a href="https://github.com/Homebrew/brew/blob/master/docs/Taps.md">How to Create a Tap</a></li>
<li><a href="https://github.com/Homebrew/homebrew-cask/blob/master/doc/development/adding_a_cask.md">How to Create a Cask (for Mac GUI Apps)</a></li>
<li>
<a href="https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md">How to Create a Formula (Command Line Apps)</a> </li>
</ul>
</li>
<li><a href="http://docopt.org"><strong>docopt</strong> - <em>Command-line interface description language</em></a></li>
<li><a href="https://github.com/JohnSundell/Publish"><strong>JohnSundell/Publish</strong> (GitHub) - A static site generator for Swift developers</a></li>
<li><a href="https://speculid.com"><strong>Speculid</strong></a></li>
<li><a href="https://www.gimp.org"><strong>Gimp</strong></a></li>
<li><a href="https://inkscape.org"><strong>Inkscape</strong></a></li>
<li><a href="https://macdown.uranusjr.com"><strong>MacDown</strong></a></li>
<li><a href="https://ulysses.app"><strong>Ulysses</strong></a></li>
</ul><p><b>Sponsors</b></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>There's a lot of demand for apps right now, so it's a really great time to give it a try. It's easier than you think.<br>The guys who run it are indie devs who had a need and created a tool. 11 years later, it's an all-in-one platform for developers who want to get more downloads and make more money with their apps.</p><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><a href="https://transistor.fm/?via=empowerapps"><strong>Transistor.Fm</strong></a><br><em>Your podcast's publishing platform<br></em>Transistor not only hosts your podcast but also:</p><ul>
<li>
<strong>Help distribute your podcast with integrations</strong> to Apple Podcasts, Spotify, Google Podcasts, YouTube, and Mailchimp</li>
<li>
<strong>Deep analytics</strong> including average downloads per episode, popular podcast apps, number of subscribers, trends</li>
<li>
<strong>Professional support</strong> for creatives, businesses, and professional podcasters when it comes to hosting and analytics</li>
</ul><p>Try it today with<a href="https://transistor.fm/?via=empowerapps"> this special link:</a><br><a href="https://transistor.fm/?via=empowerapps">https://transistor.fm/?via=empowerapps</a></p><p><b>SwiftArgumentParser</b></p><ul>
<li>Bringing Swifty-ness to the Command Line Parser</li>
<li>Works well with Xcode</li>
<li>How to Install Swift Package Tools</li>
</ul><p><b>Graphics Support in Xcode</b></p><ul>
<li>Why isn't SVG supported?</li>
<li>UIImage with SVG?</li>
<li>Does Android support SVG?</li>
<li>Bézier curve support</li>
</ul><p><b>Being a Mac User in 2020</b></p><ul>
<li>Catalina Support</li>
<li>Subscription Services</li>
<li>Adobe vs Apple</li>
<li>Native UI and UX on the Mac</li>
<li>Writing Books for Publishers</li>
</ul><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com<br><a href="https://github.com/brightdigit">GitHub - @brightdigit</a></p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><br></p><p><strong><a rel="payment" title="★ Support this podcast on Patreon ★" href="https://www.patreon.com/empowerappsshow">★ Support this podcast on Patreon ★</a></strong></p>
      