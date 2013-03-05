# Legal Cloud

## What?

I'm trying to build a set of standardized tools for one basic task: Looping through lots of law-related text, processing it, and saving the results.

Using a curated set of text processors, you should be up and running in a matter of minutes. You could do something cool like this:

```ruby
require 'legal-cloud'
require 'pry'

array_of_documents = [...] # a corpus of thousands of documents
results = LegalCloud::ProcessBlock.new(array_of_documents) do |document|
  {
    "citations"   => LegalCloud::Citations.extract!(document),
    "definitions" => LegalCloud::Definitions.extract!(document),
    "names"       => LegalCloud::Calais::Names.extract!(document)
  }
end

binding.pry

> # do stuff with `results`
```

## Why?

Under the hood, you'll get parallelism and remote code execution from IronWorker. This has several advantages over running this code on your laptop:

1. Performance. Splitting up the work into chunks is an obvious win.

2. Reliability. In the middle of a large processing job, and the power goes out and your laptop battery is about to die? No worries. Your job continues to run, with results stored safely.

3. Curation. The legal informatics/open government/open data communities are coalescing in a great way. Many standalone scripts are emerging for specific text processing tasks. I'd like this repo to be a central place where anyone can quickly make use of these great tools. Batteries included will lower barriers to entry.

4. Standardization. The legal informatics community could gain by adopting a standard project structure.

5. Verification. This builds off of point 4. Need to show how you arrived at a certain set of findings? This could be done in maybe ~20 lines of code.

I envision something as simple as installing a Ruby gem, adding some API keys, mixing and matching text processors to suit your needs, then running your corpus through in a simple loop.

## Progress

The sample code above is completely made up. I'm slowly patching together a solution. See `blank.rb` for a basic map reduce sample.

## Questions

Email: adelevie@gmail.com

Twitter: http://twitter.com/adelevie
