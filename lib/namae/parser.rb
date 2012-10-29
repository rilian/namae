#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.9
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'singleton'
require 'strscan'

module Namae
  class Parser < Racc::Parser

module_eval(<<'...end parser.y/module_eval...', 'parser.y', 90)

  include Singleton
    
  attr_reader :options
  
  def initialize
    @input, @options = StringScanner.new(''), {
      :debug => false,
      :prefer_comma_as_separator => false,
      :comma => ',',
      :separator => /\s*(\band\b|\&)\s*/i,
      :title => /\s*\b(sir|lord|(prof|dr|md|ph\.?d)\.?)(\s+|$)/i,
      :suffix => /\s*\b(jr|sr|[ivx]+)\.?\s*/i,
      :appellation => /\s*\b((mrs?|ms|fr|hr)\.?|miss|herr|frau)(\s+|$)/i
    }
  end
  
  def debug?
    options[:debug] || ENV['DEBUG']
  end
  
  def separator
    options[:separator]
  end
  
  def comma
    options[:comma]
  end

  def title
    options[:title]
  end

  def suffix
    options[:suffix]
  end

  def appellation
    options[:appellation]
  end
  
  def prefer_comma_as_separator?
    options[:prefer_comma_as_separator]
  end

  def parse(input)
    parse!(input)
  rescue => e
    warn e.message if debug?
    []
  end
  
  def parse!(string)
    input.string = normalize(string)
    reset
    do_parse
  end
  
  def normalize(string)
    string = string.strip
    string
  end
  
  def reset
    @commas, @words, @yydebug = 0, 0, debug?   
    self
  end

  private
  
  def stack
    @vstack || @racc_vstack || []
  end
  
  def last_token
    stack[-1]
  end
  
  def consume_separator
    return next_token if seen_separator?
    @commas, @words = 0, 0
    [:AND, :AND]
  end
  
  def consume_comma
    @commas += 1
    [:COMMA, :COMMA]
  end

  def consume_word(type, word)
    @words += 1
    [type, word]
  end

  def seen_separator?
    !stack.empty? && last_token == :AND
  end

  def seen_suffix?
    return false unless stack.length > 1
    last_token == :COMMA || last_token =~ suffix
  end
  
  def seen_full_name?
    prefer_comma_as_separator? && @words > 1
  end

  def next_token
    case
    when input.nil?, input.eos?
      nil
    when input.scan(separator)
      consume_separator
    when input.scan(/\s*,\s*/)
      if @commas.zero? && !seen_full_name? || @commas == 1 && seen_suffix?
        consume_comma
      else
        consume_separator
      end
    when input.scan(/\s+/)
      next_token
    when input.scan(title)
      consume_word(:TITLE, input.matched.strip)
    when input.scan(appellation)
      [:APPELLATION, input.matched.strip]
    when input.scan(/((\\\w+)?\{[^\}]*\})*[[:upper:]][^\s#{comma}]*/)
      consume_word(:UWORD, input.matched)
    when input.scan(/((\\\w+)?\{[^\}]*\})*[[:lower:]][^\s#{comma}]*/)
      consume_word(:LWORD, input.matched)
    when input.scan(/(\\\w+)?\{[^\}]*\}[^\s#{comma}]*/)
      consume_word(:PWORD, input.matched)
    when input.scan(/('[^'\n]+')|("[^"\n]+")/)
      consume_word(:NICK, input.matched[1...-1])
    else
      raise ArgumentError,
        "Failed to parse name #{input.string.inspect}: unmatched data at offset #{input.pos}"
    end
  end
    
  def on_error(tid, value, stack)
    raise ArgumentError,
      "Failed to parse name: unexpected '#{value}' at #{stack.inspect}"
  end
    
  attr_reader :input

# -*- racc -*-
...end parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
   -34,    16,   -22,   -36,   -22,   -35,   -22,   -34,    17,   -22,
   -36,   -22,   -35,   -34,    53,   -22,    14,    12,    15,    55,
   -34,     7,     8,    14,    12,    15,    42,    33,     7,     8,
    14,    22,    15,    24,    14,    22,    15,    24,    30,    28,
    31,    30,    28,    31,    49,    48,    50,    30,    39,    31,
    49,    48,    50,    49,    48,    50,    30,    28,    31,    30,
    43,    31,    49,    48,    50,    30,    28,    31,    49,    48,
    50,    14,    22,    15,    30,    32,    31,    30,    28,    31 ]

racc_action_check = [
    22,     1,    39,    15,    28,    14,    28,    22,     1,    39,
    15,    28,    14,    12,    41,    12,     0,     0,     0,    45,
    12,     0,     0,    17,    17,    17,    27,    16,    17,    17,
    20,    20,    20,    20,     9,     9,     9,     9,    25,    25,
    25,    21,    21,    21,    55,    55,    55,    24,    24,    24,
    53,    53,    53,    47,    47,    47,    10,    10,    10,    29,
    29,    29,    32,    32,    32,    35,    35,    35,    42,    42,
    42,     5,     5,     5,    40,    11,    40,    38,    38,    38 ]

racc_action_pointer = [
    13,     1,   nil,   nil,   nil,    68,   nil,   nil,   nil,    31,
    53,    73,    13,   nil,     5,     3,    27,    20,   nil,   nil,
    27,    38,     0,   nil,    44,    35,   nil,    24,     4,    56,
   nil,   nil,    59,   nil,   nil,    62,   nil,   nil,    74,     2,
    71,    12,    65,   nil,   nil,    17,   nil,    50,   nil,   nil,
   nil,   nil,   nil,    47,   nil,    41,   nil,   nil,   nil ]

racc_action_default = [
    -1,   -37,    -2,    -4,    -5,   -37,    -8,    -9,   -10,   -23,
   -37,   -37,   -19,   -26,   -28,   -29,   -37,   -37,    -6,    -7,
   -37,   -37,   -19,   -11,   -37,   -37,   -27,   -15,   -20,   -23,
   -28,   -29,   -32,    59,    -3,   -37,   -15,   -12,   -37,   -19,
   -23,   -14,   -32,   -21,   -16,   -24,   -30,   -33,   -34,   -35,
   -36,   -14,   -13,   -32,   -17,   -32,   -31,   -18,   -25 ]

racc_goto_table = [
     3,    26,    19,    44,    58,    18,     1,   nil,    27,    23,
     9,     2,    26,    54,   nil,    20,   nil,     3,   nil,    36,
    23,    26,    37,    41,    57,    21,   nil,     9,    34,    25,
   nil,   nil,    26,    51,    40,   nil,    52,   nil,   nil,   nil,
    35,   nil,   nil,   nil,    38,   nil,   nil,    56 ]

racc_goto_check = [
     3,    12,     4,    10,    11,     3,     1,   nil,     8,     3,
     7,     2,    12,    10,   nil,     7,   nil,     3,   nil,     8,
     3,    12,     8,     8,    10,     9,   nil,     7,     2,     9,
   nil,   nil,    12,     8,     7,   nil,     8,   nil,   nil,   nil,
     9,   nil,   nil,   nil,     9,   nil,   nil,     3 ]

racc_goto_pointer = [
   nil,     6,    11,     0,    -3,   nil,   nil,    10,    -2,    20,
   -29,   -51,    -8,   nil ]

racc_goto_default = [
   nil,   nil,   nil,    46,     4,     5,     6,    29,    11,    10,
   nil,    45,    13,    47 ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 11, :_reduce_1,
  1, 11, :_reduce_2,
  3, 11, :_reduce_3,
  1, 12, :_reduce_4,
  1, 12, :_reduce_none,
  2, 12, :_reduce_6,
  2, 12, :_reduce_7,
  1, 12, :_reduce_none,
  1, 15, :_reduce_9,
  1, 15, :_reduce_10,
  2, 14, :_reduce_11,
  3, 14, :_reduce_12,
  4, 14, :_reduce_13,
  3, 14, :_reduce_14,
  2, 14, :_reduce_15,
  3, 16, :_reduce_16,
  4, 16, :_reduce_17,
  5, 16, :_reduce_18,
  1, 19, :_reduce_none,
  2, 19, :_reduce_20,
  3, 19, :_reduce_21,
  1, 18, :_reduce_none,
  1, 18, :_reduce_none,
  1, 20, :_reduce_24,
  3, 20, :_reduce_25,
  1, 17, :_reduce_none,
  2, 17, :_reduce_27,
  1, 22, :_reduce_none,
  1, 22, :_reduce_none,
  1, 23, :_reduce_none,
  2, 23, :_reduce_31,
  0, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 13, :_reduce_none,
  1, 13, :_reduce_none,
  1, 13, :_reduce_none ]

racc_reduce_n = 37

racc_shift_n = 59

racc_token_table = {
  false => 0,
  :error => 1,
  :COMMA => 2,
  :UWORD => 3,
  :LWORD => 4,
  :PWORD => 5,
  :NICK => 6,
  :AND => 7,
  :APPELLATION => 8,
  :TITLE => 9 }

racc_nt_base = 10

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "COMMA",
  "UWORD",
  "LWORD",
  "PWORD",
  "NICK",
  "AND",
  "APPELLATION",
  "TITLE",
  "$start",
  "names",
  "name",
  "word",
  "display_order",
  "honorific",
  "sort_order",
  "u_words",
  "last",
  "von",
  "first",
  "opt_words",
  "u_word",
  "words" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parser.y', 10)
  def _reduce_1(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 11)
  def _reduce_2(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 12)
  def _reduce_3(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 14)
  def _reduce_4(val, _values, result)
     result = Name.new(:given => val[0]) 
    result
  end
.,.,

# reduce 5 omitted

module_eval(<<'.,.,', 'parser.y', 16)
  def _reduce_6(val, _values, result)
     result = val[0].merge(:family => val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 17)
  def _reduce_7(val, _values, result)
     result = val[1].merge(val[0]) 
    result
  end
.,.,

# reduce 8 omitted

module_eval(<<'.,.,', 'parser.y', 20)
  def _reduce_9(val, _values, result)
     result = Name.new(:appellation => val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 21)
  def _reduce_10(val, _values, result)
     result = Name.new(:title => val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 25)
  def _reduce_11(val, _values, result)
             result = Name.new(:given => val[0], :family => val[1])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 29)
  def _reduce_12(val, _values, result)
             result = Name.new(:given => val[0], :nick => val[1], :family => val[2])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 33)
  def _reduce_13(val, _values, result)
             result = Name.new(:given => val[0], :nick => val[1],
           :particle => val[2], :family => val[3])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 38)
  def _reduce_14(val, _values, result)
             result = Name.new(:given => val[0], :particle => val[1],
          :family => val[2])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 43)
  def _reduce_15(val, _values, result)
             result = Name.new(:particle => val[0], :family => val[1])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 48)
  def _reduce_16(val, _values, result)
             result = Name.new(:family => val[0], :suffix => val[2][0],
           :given => val[2][1])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 53)
  def _reduce_17(val, _values, result)
             result = Name.new(:particle => val[0], :family => val[1],
           :suffix => val[3][0], :given => val[3][1])
       
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 58)
  def _reduce_18(val, _values, result)
             result = Name.new(:particle => val[0,2].join(' '), :family => val[2],
           :suffix => val[4][0], :given => val[4][1])
       
    result
  end
.,.,

# reduce 19 omitted

module_eval(<<'.,.,', 'parser.y', 64)
  def _reduce_20(val, _values, result)
     result = val.join(' ') 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 65)
  def _reduce_21(val, _values, result)
     result = val.join(' ') 
    result
  end
.,.,

# reduce 22 omitted

# reduce 23 omitted

module_eval(<<'.,.,', 'parser.y', 69)
  def _reduce_24(val, _values, result)
     result = [nil,val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 70)
  def _reduce_25(val, _values, result)
     result = [val[0],val[2]] 
    result
  end
.,.,

# reduce 26 omitted

module_eval(<<'.,.,', 'parser.y', 73)
  def _reduce_27(val, _values, result)
     result = val.join(' ') 
    result
  end
.,.,

# reduce 28 omitted

# reduce 29 omitted

# reduce 30 omitted

module_eval(<<'.,.,', 'parser.y', 78)
  def _reduce_31(val, _values, result)
     result = val.join(' ') 
    result
  end
.,.,

# reduce 32 omitted

# reduce 33 omitted

# reduce 34 omitted

# reduce 35 omitted

# reduce 36 omitted

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Namae
