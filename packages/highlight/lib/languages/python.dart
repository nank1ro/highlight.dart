// GENERATED CODE - DO NOT MODIFY BY HAND

import '../src/mode.dart';
import '../src/common_modes.dart';

// https://docs.python.org/3.9/reference/lexical_analysis.html#numeric-literals
const digitpart = '[0-9](_?[0-9])*';
const pointfloat = '(\\b($digitpart))?\\.($digitpart})|\\b($digitpart)\\.';

const reserved_words = [
  'and',
  'as',
  'assert',
  'async',
  'await',
  'break',
  'class',
  'continue',
  'def',
  'del',
  'elif',
  'else',
  'except',
  'finally',
  'for',
  'from',
  'global',
  'if',
  'import',
  'in',
  'is',
  'lambda',
  'nonlocal|10',
  'not',
  'or',
  'pass',
  'raise',
  'return',
  'try',
  'while',
  'with',
  'yield'
];

const literals = [
  '__debug__',
  'Ellipsis',
  'False',
  'None',
  'NotImplemented',
  'True'
];

final python = Mode(
    refs: {
      '~contains~3~variants~2~contains~3': Mode(
          className: "subst",
          begin: "\\{",
          end: "\\}",
          keywords: {
            "keyword": reserved_words.join(" "),
            "built_in": literals.join(" "),
            "literal": "False None True"
          },
          illegal: "#",
          contains: [
            Mode(ref: '~contains~3'),
            Mode(ref: '~contains~1'),
            Mode(ref: '~contains~0')
          ]),
      '~contains~3~variants~2~contains~2': Mode(begin: "\\{\\{", relevance: 0),
      '~contains~3': Mode(className: "string", contains: [
        BACKSLASH_ESCAPE
      ], variants: [
        Mode(
            begin: r"/([uU]|[bB]|[rR]|[bB][rR]|[rR][bB])?'''/",
            end: "'''",
            contains: [BACKSLASH_ESCAPE, Mode(ref: '~contains~0')],
            relevance: 10),
        Mode(
            begin: r'/([uU]|[bB]|[rR]|[bB][rR]|[rR][bB])?"""/',
            end: "\"\"\"",
            contains: [BACKSLASH_ESCAPE, Mode(ref: '~contains~0')],
            relevance: 10),
        Mode(begin: r"/([fF][rR]|[rR][fF]|[fF])'''/", end: "'''", contains: [
          BACKSLASH_ESCAPE,
          Mode(ref: '~contains~0'),
          Mode(ref: '~contains~3~variants~2~contains~2'),
          Mode(ref: '~contains~3~variants~2~contains~3')
        ]),
        Mode(begin: r'/([fF][rR]|[rR][fF]|[fF])"""/', end: r'""', contains: [
          BACKSLASH_ESCAPE,
          Mode(ref: '~contains~0'),
          Mode(ref: '~contains~3~variants~2~contains~2'),
          Mode(ref: '~contains~3~variants~2~contains~3')
        ]),
        Mode(begin: "(u|r|ur)'", end: "'", relevance: 10),
        Mode(begin: "(u|r|ur)\"", end: "\"", relevance: 10),
        Mode(begin: "(b|br)'", end: "'"),
        Mode(begin: "(b|br)\"", end: "\""),
        Mode(begin: "(fr|rf|f)'", end: "'", contains: [
          BACKSLASH_ESCAPE,
          Mode(ref: '~contains~3~variants~2~contains~2'),
          Mode(ref: '~contains~3~variants~2~contains~3')
        ]),
        Mode(begin: "(fr|rf|f)\"", end: "\"", contains: [
          BACKSLASH_ESCAPE,
          Mode(ref: '~contains~3~variants~2~contains~2'),
          Mode(ref: '~contains~3~variants~2~contains~3')
        ]),
        APOS_STRING_MODE,
        QUOTE_STRING_MODE
      ]),
      '~contains~1': Mode(className: "number", relevance: 0, variants: [
        // exponentfloat, pointfloat
        // https://docs.python.org/3.9/reference/lexical_analysis.html#floating-point-literals
        // optionally imaginary
        // https://docs.python.org/3.9/reference/lexical_analysis.html#imaginary-literals
        // Note: no leading \b because floats can start with a decimal point
        // and we don't want to mishandle e.g. `fn(.5)`,
        // no trailing \b for pointfloat because it can end with a decimal point
        // and we don't want to mishandle e.g. `0..hex()`; this should be safe
        // because both MUST contain a decimal point and so cannot be confused with
        // the interior part of an identifier
        Mode(
            begin:
                "(\\b($digitpart)|($pointfloat))[eE][+-]?($digitpart)[jJ]?\\b"),
        Mode(begin: "($pointfloat)[jJ]?"),
        Mode(begin: "\\b([1-9](_?[0-9])*|0+(_?0)*)[lLjJ]?\\b"),
        Mode(begin: "\\b0[bB](_?[01])+[lL]?\\b"),
        Mode(begin: "\\b0[oO](_?[0-7])+[lL]?\\b"),
        Mode(begin: '\\b0[xX](_?[0-9a-fA-F])+[lL]?\\b'),
        // imagnumber (digitpart-based)
        // https://docs.python.org/3.9/reference/lexical_analysis.html#imaginary-literals
        Mode(begin: '\\b($digitpart)[jJ]\\b'),
      ]),
      '~contains~0': Mode(className: "meta", begin: "^(>>>|\\.\\.\\.) "),
    },
    aliases: ["py", "gyp", "ipython"],
    keywords: {
      "keyword": reserved_words.join(" "),
      "built_in": literals.join(" "),
      "literal": "False None True"
    },
    illegal: "(<\\/|->|\\?)|=>",
    contains: [
      Mode(ref: '~contains~0'),
      Mode(ref: '~contains~1'),
      Mode(beginKeywords: "if", relevance: 0),
      Mode(ref: '~contains~3'),
      HASH_COMMENT_MODE,
      Mode(
          variants: [
            Mode(className: "function", beginKeywords: "def"),
            Mode(className: "class", beginKeywords: "class")
          ],
          end: ":",
          illegal: "[\${=;\\n,]",
          contains: [
            UNDERSCORE_TITLE_MODE,
            Mode(className: "params", begin: "\\(", end: "\\)", contains: [
              Mode(self: true),
              Mode(ref: '~contains~0'),
              Mode(ref: '~contains~1'),
              Mode(ref: '~contains~3'),
              HASH_COMMENT_MODE
            ]),
            Mode(begin: "->", endsWithParent: true, keywords: "None")
          ]),
      Mode(className: "meta", begin: "^[\\t ]*@", end: "\$"),
      Mode(begin: "\\b(print|exec)\\(")
    ]);
