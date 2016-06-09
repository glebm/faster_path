require "faster_path/version"
require 'pathname'
require "ffi"

module FasterPath
  def self.absolute?(pth)
    Rust.absolute(pth)
  end

  private
  module Rust
    extend FFI::Library
    ffi_lib 'target/release/libfaster_path.so'
    attach_function :absolute, [ :string ], :bool
  end
  private_constant :Rust
end
