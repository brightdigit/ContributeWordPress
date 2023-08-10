<p align="center">
    <img alt="ContributeWordPress" title="ContributeWordPress" src="Sources/ContributeWordPress/Documentation.docc/Resources/ContributeWordPressLogo.png" height="125">
</p>
<h1 align="center">ContributeWordPress</h1>

Import your WordPress site into Publish.

[![SwiftPM](https://img.shields.io/badge/SPM-Linux%20%7C%20iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-success?logo=swift)](https://swift.org)
[![Twitter](https://img.shields.io/badge/twitter-@brightdigit-blue.svg?style=flat)](http://twitter.com/brightdigit)
![GitHub](https://img.shields.io/github/license/brightdigit/ContributeWordPress)
![GitHub issues](https://img.shields.io/github/issues/brightdigit/ContributeWordPress)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/brightdigit/ContributeWordPress/ContributeWordPress.yml?label=actions&logo=github&?branch=main)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FContributeWordPress%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/brightdigit/ContributeWordPress)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FContributeWordPress%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/brightdigit/ContributeWordPress)


[![Codecov](https://img.shields.io/codecov/c/github/brightdigit/ContributeWordPress)](https://codecov.io/gh/brightdigit/ContributeWordPress)
[![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/brightdigit/ContributeWordPress)](https://www.codefactor.io/repository/github/brightdigit/ContributeWordPress)
[![codebeat badge](https://codebeat.co/badges/54695d4b-98c8-4f0f-855e-215500163094)](https://codebeat.co/projects/github-com-brightdigit-ContributeWordPress-main)
[![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/brightdigit/ContributeWordPress)](https://codeclimate.com/github/brightdigit/ContributeWordPress)
[![Code Climate technical debt](https://img.shields.io/codeclimate/tech-debt/brightdigit/ContributeWordPress?label=debt)](https://codeclimate.com/github/brightdigit/ContributeWordPress)
[![Code Climate issues](https://img.shields.io/codeclimate/issues/brightdigit/ContributeWordPress)](https://codeclimate.com/github/brightdigit/ContributeWordPress)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

# Table of Contents

* [Introduction](#introduction)
   * [Requirements](#requirements)
   * [Installation](#installation)
   * [How It Works](#how-it-works)
   * [Exporting from WordPress](#exporting-from-wordpress)
* [Usage](#usage)
   * [Getting Started](#getting-started)
   * [Exporting to Publish](#exporting-to-publish)
   * [Dowloading Resources from Active Site](#dowloading-resources-from-active-site)
   * [Copy Resources from Local Backup](#copy-resources-from-local-backup)
   * [Converting Posts to Markdown](#converting-posts-to-markdown)
   * [Using ShellOut and Pandoc for Markdown](#using-shellout-and-pandoc-for-markdown)
   * [Filtering Posts](#filtering-posts)
   * [Redirecting Old URLs](#redirecting-old-urls)
   * [Using SwiftArgumentParser for Settings](#using-swiftargumentparser-for-settings)
   * [Further Documentation](#further-documentation)
* [License](#license)

# Introduction

**ContributeWordPress** provides an undis manus herbarum Theseus? Et **graves**, ille? Genusque non
quatenus [suos Hippodamen](http://www.mersitquemagnae.com/superetque.php)

## Requirements 

**Apple Platforms**

- Xcode 14.3.1 or later
- Swift 5.8 or later
- iOS 14 / watchOS 7 / tvOS 14 / macOS 12 or later deployment targets

**Linux**

- Ubuntu 18.04 or later
- Swift 5.8 or later

## Installation

Use the Swift Package Manager to install this library via the repository url:

```
https://github.com/brightdigit/ContributeWordPress.git
```

Use version up to `1.0.0`.

## How It Works

**ContributeWordPress** uses the exported XML (also referred to as WXR file) to import content into your existing **Publish** site. 

```swift
import ContributeWordPress

let fromURL = URL(
    fileURLWithPath: "directory/containing/your/export/xml/files"
)
let toURL = URL(
    fileURLWithPath: "Path/to/Publish/root"
)

try MarkdownProcessor.beginImport(
    from: fromURL, 
    to: toURL
)
```

In order to begin, you need:

* The exported **XML file** 
* The active WordPress site or a complete download of the site's files (for the images on your site)

## Exporting from WordPress

**ContributeWordPress** needs a backup XML file from your **WordPress** site. To do this:

1. Login to your WordPress Administration Dashboard.
2. Go to Tools... Export:
![WordPress-Tools...Export](Sources/ContributeWordPress/Documentation.docc/Resources/tools-export-download-file.png)
3. Download your export file by:
    * Clicking the Export All button (if you have a site without plugins installed.)
    * Selecting all content and clicking the Download Export File button (if you have a site with plugins installed.)
    * Download specific content only, like posts, pages, or feedback.
4. You will receive a .zip file to save to your computer with the .xml file inside of it. This file contains your posts, pages, comments, categories, tags, and references to your site’s images.

Larger sites will include more than one XML file to ensure that your export process will be fast and complete successfully, for instance if you are running multi-site **WordPress**. Luckily **ContributeWordPress** supports importing multiple xml files! When importing the BrightDigit website, the content was importing for the learningswift.brightdigit.com into brightdigit.com/tutorials and brightdigit.com into brightdigit.com/articles.

For more details on the export process, please read [the documentation on the **WordPress** site.](https://wordpress.com/support/export/)

# Usage

## Getting Started

Besides exporting your **WordPress site**, you need access to the images by either:
* downloading directly from the site
* having a copy of the site's files

![Example Copy of the WordPress Site's Files](Sources/ContributeWordPress/Documentation.docc/Resources/wordpress-site-files.png "Example Copy of the WordPress Site's Files")

Once you have both components, [you need to setup a **Publish** site]((https://github.com/JohnSundell/Publish)). There are several great tutorials online:

* [JohnSundell/Publish: A static site generator for Swift developers](https://github.com/JohnSundell/Publish)
* [How to Create a Personal Website in Swift using Publish | Danijela's blog](https://www.danijelavrzan.com/posts/2022/06/create-portfolio-website-using-publish/)
* [Static Site Generation with Swift using Publish, Plot and Ink](https://www.createwithswift.com/static-site-generation-with-swift-using-publish/)
* [Getting started with static-site generation in Swift using Publish | Andy Regensky](https://andyregensky.dev/articles/publish-getting-started/)

Once the site is setup, we can:

* convert and translate the HTML inside your exported XML (also referred to as WXR file) to Markdown files inside your _Content_ directory
* download (or copy) your images and other files inside your WordPress upload folder to your _Resources_ directory
## Exporting to Publish

The simplest way to import your **WordPress** site is by just passing the path to your xml files as well as the root of your **Publish** site.

```swift
import ContributeWordPress

let fromURL = URL(
    fileURLWithPath: "directory/containing/your/export/xml/files"
)
let toURL = URL(
    fileURLWithPath: "Path/to/Publish/root"
)

try MarkdownProcessor.beginImport(
    from: fromURL, 
    to: toURL
)
```

If you wish to create a small command line application you can take in command line arguments for the two paths:

```swift
import ContributeWordPress

let fromURL : URL
let toURL : URL

guard CommandLine.arguments.count == 2 else {
  exit(1)
}

fromURL = .init(fileURLWithPath: CommandLine.arguments[0])
toURL = .init(fileURLWithPath: CommandLine.arguments[1])

try! MarkdownProcessor.beginImport(from: fromURL, to: toURL)
```

## Dowloading Resources from Active Site

By default, **ContributeWordPress** will download the images from your active **WordPress** site. Therefore if it comes across a reference to url to your site it will change the url to the new address it will be imported to.

Therefore HTML from your exports file will change from:

```html
<figure class="wp-block-image"><img src="https://leogdion.name/wp-content/uploads/2019/01/image-e1547230562842-1024x682.jpg" alt="A JavaScript Meetup I hosted in 2018 " class="wp-image-105"/><figcaption>A JavaScript Meetup I hosted in 2018 </figcaption></figure>
```

to this in your markdown file:

```html
<figure class="wp-block-image">
<img
src="/media/wp-assets/default/2019/01/image-e1547230562842-1024x682.jpg"
class="wp-image-105" alt="A JavaScript Meetup I hosted in 2018 " />
<figcaption>A JavaScript Meetup I hosted in 2018</figcaption>
</figure>
```

## Copy Resources from Local Backup


If your site is no longer active but you have a local copy of the site, you can pass in that directory to be used instead.

Let's expand on our previous command line example by adding an optional parameter:

```swift
let fromURL : URL
let toURL : URL

let importAssetsSetting : AssetImportSetting

guard CommandLine.arguments.count >= 2 else {
  exit(1)
}

fromURL = URL(fileURLWithPath: CommandLine.arguments[0])
toURL = URL(fileURLWithPath: CommandLine.arguments[1])

// if a third argument is passed
if CommandLine.arguments.count > 2 {
  // assume they want to copy the resources directly
  importAssetsSetting = .copyFilesFrom(
    URL(fileURLWithPath: CommandLine.arguments[2])
  )
} else {
  // otherwise use the default `download` option
  importAssetsSetting = .download
}

try! MarkdownProcessor.beginImport(
  from: fromURL,
  to: toURL,
  importAssetsBy: importAssetsSetting
)

```

Therefore you can call:

```bash
> wpublish \
  directory/with/export/xml/files \
  Path/to/Publish/root \
  path/to/root/wordpress/files
```

The `AssetImportSetting` option contains three options:
* `none` - don't do anything
* `download` - download them from the WordPress site
* `copyFilesFrom(URL)` - copy the files from a local mapped location

## Converting Posts to Markdown

_Explain default is no conversion. Here's how to create MarkdownGenerator._

Lorem markdownum Beroe mandabat ignibus, alimentaque servat saeva lotos, aquas
potui. Hanc cui: virides magno! Quodsi quae fugant ait lumina, Gorgenque
cornibus, cognitius magis illo ferrum. Quem terra erat moverat Celadontis erat
imitata sequentis mutentur Iuppiter. Et armis volutant te terra si cruentae
quoque memorata, ne Aeneas trahoque hunc, Primus nitore.

    if (pppoe(fpu, sd_pup_extranet) * servlet * systemDriverPath) {
        cell_edutainment.directory(1);
    }
    if (pcb_social_pdf / windows == dllIvrUser(document, malware)) {
        dlc_modifier_tweak(5, mebibyte_video(82, 5012, troll_printer_quad));
    } else {
        terminalQbe.installUgcNtfs(264001, busIpvLock);
        bookmarkDatabase.rpm += 4 + bank + 5;
        code_drag_software.mountBalancing += peripheralKilobit + igpTrashBare +
                1;
    }
    if (5 + dualOcr) {
        directx_us(deprecated_analog_teraflops, 2, 51);
    }
    if (oasis_disk_soap) {
        dataHdv.dslam(ergonomicsVerticalFont, saas_media_plug);
    } else {
        so_cpc /= requirementsMampCursor;
        softwareVoipKey.commerceGraphic += carrierHardCard(dataUnicodeUri,
                resources, 19) * bespoke;
    }
    model_bezel.pharming_transistor_pci(gibibyte, ram_refresh_program);

Morte stat ingenio mugiat, haec tuentibus divite ora Iasonis ultima fugit
*fatis* odoribus. Capitisque videt. Vixque hippomene ibat, iam sub, te aras,
mundo?

Here's how to use...

## Using ShellOut and Pandoc for Markdown

_How to use ShellOut and install Pandoc_

Lorem markdownum erat patriisque numquamque alto ferrea quibus nam penates
vicit: sine movit occumbere Dianam, imaginis, ab. Rector pharetras at populique
animos, dissuadet felicem, classis: non sine flammaeque, modo species habemus
montes. Sequitur copia, mater anteit fuit fideque victo, in Te nescio, aliquid,
huic cum. Taedae hoc in sudore artificem quidem, in amans obstat tu?

- Medea nunc mihi hostes socio
- Excutiunt undas leonum plangore tamen
- Quae ignotos satyrique nimium
- A magna Error

Gerebam simul dorso hospitio coleretur carmine consistere femina rubescere
Enaesimus ineo nunc tum et prensoque debes toto: posset. Per stellatus lumina
Epaphus ego. Non ut et dixere alimentaque dicor, in deos turba, est. **Tecum
in** neque in semine si variarum sepulcrum legerat tetigere omnia pressere
moderatior iacet prolemque miserabile aquilonibus.

- Confinia iniquo oneri qua primo versasque numen
- Praevalidusque supplex conpositum pater caelumque sensi
- Collum caeleste

Diversa inutile magna exiguamque sedet Iuppiter curvata generosam, ore supplex.
Vos fatus quam aurora visaque heros. Toto mundumque hic, socia fiet delicta est
manebo nostrae pectore.

## Filtering Posts

Clipeum mihi munera ternis; Non funestas *enervet*. Vicinia furiosaque minus.
Quo cruor relinquitur hiatus circumfunditur **sua**: quem tenebas exprimitur
indicet, prius copia; canes quod. Erit acie Procne pigneror et paulatim in
remulus et Thebis superest inclusum ora cannis, nigri [at
fuit](http://pavetque-quanto.org/cyclopumet)! Iunone Mendesius funeribus simus,
*qua*!

- Modo ait ullum vicit saevisque sua
- Cingere et raptos meas iugo iacuere atque
- Est eripiunt Hecaben inmedicabile rapta intendit cruentum
- Epulis iacuere
- Nepotum oscula et mittere desiluit pennis

Saxa exuvias, non inde cultores, in Venere robora. Augerem aptamque, fugio
inducit vos abluere nuntiet coniunx praetendat et vocantia est Crete memor
sequentia venis, nox matutina! Et germanae dubie.

## Redirecting Old URLs

Rexit terrae mane manumque, cum viscata adicit miles. Vota veluti angustis, si
quis, loqui venerit adspicit, [meque](http://de.org/) suum [fuit
qua](http://luctus.org/sed). Esset invaserat tibique et pudorem totaeque
recentis frena! Dapes ab deinde. Silvamque caelatus quam!

Arne sed ego regia, una quem, terra, Attis nova tendere ab volucrem feror et
partes utinam, busta. Mitia gemitu secundo? Miseri nomen, via ora abrumpit
dimovit comes enim recens contraria litoris qua pharetrae iussa, species ait?
Per Dixit sed dea pars blandita, [idem patiere animo](http://www.et.net/fruges)
inmansuetusque falsum.

## Using SwiftArgumentParser for Settings

Lorem *markdownum procul* dabat nam committe omni sunt puer si nomine,
tremoribus differt ex! Ipse genua studeat: tertia **fidum nobilitate alba**
potentior pisces; quid manus undis transit est. Hortos **ipse** rupit Triptolemo
Talia: utinam exempla, aequora una.

1. Dicta quid amantem Danaam
2. Pulsa fugant colore
3. Sed flumina atria totis modo Semele cecidit
4. Antiquam tale silvis opus perque
5. Enim frequens caelum

Porrigit levant, puellae. Abesse de harena enim emisitque haud incultos fuderat
lumina. Onus *fama mensor*.

## Further Documentation

Further documentation is available at [the Swift Package Index.](https://swiftpackageindex.com/brightdigit/ContributeWordPress/1.0.0/documentation/ContributeWordPress)

# License 

This code is distributed under the MIT license. See the [LICENSE](https://github.com/brightdigit/ContributeWordPress/LICENSE) file for more info.
