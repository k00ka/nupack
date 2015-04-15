# nupack solution by k00ka (David Andrews)

To use the library, simply use:  
_require "nupack"_  
in your source.

The main code is in _package.rb_ and _product.rb_. RSpec unit tests are included for each.
The _nupack.rb_ file is a convenience file for loading the library.

Releases:  
1.0 - base functionality - simple and straightforward solution  
1.1 - refactor to use an abstract factory - benefits by separating Products from Package (but scores higher on flog) :(  
1.2 - further separate Product from Package - use _require "nupack"_ to access library
