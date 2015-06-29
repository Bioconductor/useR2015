## Overview

DNA sequence analysis generates large volumes of data presenting
challenging bioinformatic and statistical problems. This tutorial
introduces established and new
[_Bioconductor_](http://bioconductor.org) packages and work flows for
the analysis of sequence data. We learn about approaches for
efficiently manipulating sequences and alignments, and introduce
common work flows and the unique statistical challenges associated
with 'RNAseq', variant annotation, and other experiments. The emphasis
is on exploratory analysis, and the analysis of designed
experiments. The workshop emphasizes orientation within the
_Bioconductor_ milieu; we will touch on the [AnnotationHub][],
[Biostrings][], [GenomicRanges][], [GenomicAlignments][], [DESeq2][],
and other packages, with short exercises to illustrate the
functionality of each package.

## Goals

- Gain overall familiarity with _Bioconductor_ packages for
  high-throughput sequence analysis, including _Bioconductor_
  vignettes and classes.

- Obtain experience running bioninformatic work flows for data quality
  assessment, RNA-seq differential expression, and manipulating
  variant call format files

- Appreciate the importance of ranges and range-based manipulation for
  modern genomic analysis

- Learn 'best practices' for working with large data

## Outline

- Introduction to _Bioconductor_ -- packages and classes

- Short work flows

  - Exploring sequences and alignments
  - RNA-seq: a high-level tour
  - Annotating variants

## Prerequisites

The workshop assumes an intermediate level of familiarity with R, and
basic understanding of biological and technological aspects of
high-throughput sequence analysis. Participants should come prepared
with a modern wireless-enabled laptop and web browser installed.

We will use pre-configured Amazon machine instances during the course,
so no package installation is necessary. For use after the course,
install necessary software with the following commands

    source("http://bioconductor.org/biocLite.R")
    biocLite(c("shiny", "airway", "AnnotationHub", "Biostrings",
        "DESeq2", "GenomicAlignments", " GenomicFiles", "GenomicRanges",
        "Rsamtools", "TxDb.Hsapiens.UCSC.hg19.knownGene", "org.Hs.eg.db",
        "Homo.sapiens", "RNAseqData.HNRNPC.bam.chr14"))
    biocLite("Bioconductor/useR2015")

## Intended Audience

This workshop is for professional bioinformaticians and statisticians
intending to use _R_ / _Bioconductor_ for analysis and comprehension
of high-throughput sequence data.

[AnnotationHub]: http://bioconductor.org/packages/AnnotationHub
[Biostrings]: http://bioconductor.org/packages/Biostrings
[GenomicAlignments]: http://bioconductor.org/packages/GenomicAlignments
[GenomicRanges]: http://bioconductor.org/packages/GenomicRanges
[DESeq2]: http://bioconductor.org/packages/DESeq2
