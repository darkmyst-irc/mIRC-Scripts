; Kin's Control Script for DarkMyst Operators and Administrators
; mIRC client remote script
; Charybdis IRCd and Antheme IRC Services

; 2018-03-19 v1.1 User Modes
; 2018-03-19 v1.0 Start

; ================================================================
; User Modes
; ================================================================
menu * {
  $iif($network == Darkmyst,DarkMyst Control Script)
  .$iif($status == connected,,$style(2)) User Modes $+ $chr(58) $usermode
  ..$iif($is.umode(g),$style(1)) +g $nbsp Caller ID (Block PMs until /ACCEPT <nickname>):$iif($is.umode(g),flip.umode -g,flip.umode +g)
  ..$iif($is.umode(R),$style(1)) +R $nbsp Reject messages from unauthenticated users:$iif($is.umode(R),flip.umode -R,flip.umode +R)
  ..$iif($is.umode(w),$style(1)) +w $nbsp Receive WALLOPS messages:$iif($is.umode(w),flip.umode -w,flip.umode +w)
  ..$iif($is.umode(D),$style(1)) +D $nbsp Deaf to channel messages:$iif($is.umode(D),flip.umode -D,flip.umode +D)
  ..$iif($is.umode(Q),$style(1)) +Q $nbsp Disable channel forwarding:$iif($is.umode(Q),flip.umode -Q,flip.umode +Q)
  ..$iif($is.umode(i),$style(1)) +i $nbsp Invisible (Unlisted in WHO and NAMES responses):$iif($is.umode(i),flip.umode -i,flip.umode +i)
  .. -
  ..$iif($is.umode(S),$style(3),$style(2)) +S $nbsp Network service (Unsettable):$iif($is.umode(S),flip.umode -S,flip.umode +S)
  ..$iif($is.umode(Z),$style(3),$style(2)) +Z $nbsp SSL (Using a secure connection):$iif($is.umode(Z),flip.umode -Z,flip.umode +Z)
}

menu * {
  $iif($network == Darkmyst && $is.umode(o),DarkMyst Control Script)
  .$iif($status == connected,,$style(2)) User Modes $+ $chr(58) $usermode
  .. -
  ..$iif($is.umode(o),$style(1)) +o $nbsp IRC Operator (IRC Oper only):$iif($is.umode(o),flip.umode -o,flip.umode +o)
  ..$iif($is.umode(s),$style(1)) +s $nbsp Receive server notices (IRC Oper only):$iif($is.umode(s),flip.umode -s,flip.umode +s)
  ..$iif($is.umode(l),$style(1)) +l $nbsp Receive LOCOPS messages (IRC Oper only):$iif($is.umode(l),flip.umode -l,flip.umode +l)
  ..$iif($is.umode(z),$style(1)) +z $nbsp Receive OPERWALL messages (IRC Oper only):$iif($is.umode(z),flip.umode -z,flip.umode +z)
  ..$iif($is.umode(a),$style(1),$iif($is.umode(o),,$style(2))) +a $nbsp Show ' $+ $me is a Server Administrator' in Whois (Network Admin only):$iif($is.umode(a),flip.umode -a,flip.umode +a)
}

menu status,query,channel,nicklist {
}

alias -l is.umode { if ($$1 isincs $gettok($usermode,1,32)) { return $true } | return $false }
alias -l flip.umode { !mode $me $$1 }
alias -l nbsp { return $str($chr(160),2) }

; ================================================================
; Channel Modes
; ================================================================
menu * {
  $iif($network == Darkmyst,DarkMyst Control Script)
  .$iif($chan,,$style(2)) Channel Modes $+ $chr(58) $chan($chan).mode
}

alias -l is.chmode { if ($$1 isincs $gettok($chan($chan).mode,1,32)) { return $true } | return $false }
