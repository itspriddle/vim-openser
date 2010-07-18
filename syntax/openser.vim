" -*- vim -*-
" FILE: openser.vim
" LAST MODIFICATION: 2008-05-18 23:35
" (C) Copyright 2008 Stanisław Pitucha <viraptor@gmail.com>
" Version: 1.00

" USAGE:
"
" Save this file to $VIMFILES/syntax/openser.vim. Either add a detection
" script to filetypes.vim, or set filetype manually to "openser" when
" editing openser configuration file.
"
" List of keyword and core functions taken from latest documentation of
" version 1.3.X of openser. Module functions not included.
"
" Tested only on vim 7.1
"
" Example: "setf openser"
"
" REQUIREMENTS:
" vim (>= 7)

if exists("b:current_syntax")
  finish
endif

set foldmethod=syntax
set foldlevel=99

syn match   openserConfigParamLine  '^[^=]\+=.*$' contains=openserCoreParameter,openserString,openserConfigConstant,openserSpecial,openserNumber,openserCppComment,openserHashComment
syn region  openserConfigModparam   start='^\s*modparam\s*(' end=')' contains=openserString,openserNumber
syn match   openserConfigModule     '^\s*loadmodule\s*"[^"]\+"' contains=openserString
syn keyword openserTodo             TODO FIXME XXX contained
syn match   openserOperator         '!\|&&\|||\|=[~=]\?\|>\|<\|+\|-\|/\|\*\||\|&\|^\|\~' display contained

syn region  openserCppComment       start='/\*' end='\*/' contains=openserTodo
syn match   openserHashComment      '#.*$' contains=openserTodo

syn match   openserStringEscape     '\\.' contained
syn match   openserNumber           '[0-9]\+' contained
syn region  openserString           matchgroup=openserStringDelimiter start="\"" end="\"" skip="\\\\\|\\\"" contained contains=openserVariable,openserStringEscape
syn region  openserString           matchgroup=openserStringDelimiter start="'"  end="'"  skip="\\\\\|\\'"  contained contains=openserVariable,openserStringEscape
syn match   openserVariable         "$[a-zA-Z_][a-zA-Z0-9_]*\(([^)]\+)\)\?" contained
syn match   openserIdentifier       '\<[a-zA-Z_][a-zA-Z0-9_]*\>' contained
syn keyword openserConditional      if else switch case contained
syn keyword openserSpecial          yes no contained
syn keyword openserCoreKeyword      af dst_ip dst_port from_uri method msg:len $retcode proto status src_ip src_port to_uri uri contained
syn keyword openserCoreValue        INET INET6 TCP UDP max_len myself null contained
syn keyword openserCoreFunction     add_local_rport append_branch break drop exit force_rport force_send_socket force_tcp_alias forward isdsturiset isflagset isbflagset issflagset log prefix pv_printf return resetdsturi resetflag resetbflag resetsflag revert_uri rewritehost sethost rewritehostport sethostport rewriteuser setuser rewriteuserpass setuserpass rewriteport setport rewriteuri seturi send set_advertised_address set_advertised_port setdsturi setflag setbflag setsflag strip strip_tail contained

syn keyword openserCoreParameter    advertised_address advertised_port alias avp_aliases auto_aliases check_via children chroot debug disable_core_dump disable_dns_blacklist disable_dns_failover disable_tcp disable_tls dns dns_retr_time dns_retr_no dns_servers_no dns_try_ipv6 dns_use_search_list dst_blacklist fork group gid listen log_facility log_name log_stderror max_while_loops maxbuffer memlog mcast_loopback mcast_ttl mhomed mpath open_files_limit port reply_to_via rev_dns server_header server_signature sip_warning tcp_children tcp_accept_aliases tcp_send_timeout tcp_connect_timeout tcp_connection_lifetime tcp_max_connections tcp_poll_method tls_ca_list tls_certificate tls_ciphers_list tls_domain tls_handshake_timeout tls_log tls_method tls_port_no tls_private_key tls_require_certificate tls_send_timeout tls_verify tos user uid user_agent_header wdir contained

syn region  openserBlock            start='{' end='}' contained contains=openserBlock,@openserCodeElements transparent fold

syn match   openserFunction         '\<\(failure_\|onreply_\|branch_\|error_\)\?route\>\(\s*\[[^\]]\+\]\)\?' contained contains=openserNumber
syn region  openserFunctionFold     matchgroup=openserFunction start="\<\(failure_\|onreply_\|branch_\|error_\)\?route\>\(\|\[\s*\[[^\]]\+\]\)\|\]\?\s*\n*{" matchgroup=NONE end="}" transparent fold contains=openserBlock,@openserCodeElements

syn cluster openserCodeElements     contains=openserCppComment,openserHashComment,openserNumber,openserString,openserVariable,openserOperator,openserConditional,openserKeyword,openserCoreKeyword,openserCoreValue,openserCoreFunction,openserIdentifier

"syn sync match openserFunctionSync  groupthere NONE "^\s*\(failure_\|onreply_\)\?route\s*\(\[[^\]]\+\]\)\?\s*{"
syn sync fromstart
"syn sync match openserSync          grouphere openserFunctionFold "\<\(failure_|onreply_\)\?route\>"
"syn sync match openserSync          grouphere NONE "^}"


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_lisp_syntax_inits")
  if version < 508
    let did_lisp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink openserCppComment       Comment
  HiLink openserHashComment      Comment
  HiLink openserTodo             Todo

  HiLink openserConfigModparam   Function
  HiLink openserConfigModule     Keyword

  HiLink openserKeyword          Keyword
  HiLink openserCoreKeyword      Special
  HiLink openserCoreValue        Special
  HiLink openserCoreFunction     Function
  HiLink openserFunction         Function
  HiLink openserIdentifier       Identifier
  HiLink openserSpecial          Special
  HiLink openserCoreParameter    Keyword

  HiLink openserOperator         Operator

  HiLink openserConditional      Conditional

  HiLink openserNumber           Number
  HiLink openserVariable         Identifier
  HiLink openserString           String
  HiLink openserStringDelimiter  Delimiter
  HiLink openserStringEscape     Special

  delcommand HiLink
endif

let b:current_syntax = "openser"

" vim: nowrap sw=2 sts=2 ts=2 et:
