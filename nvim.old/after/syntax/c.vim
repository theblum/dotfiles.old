syntax match myTagLabel /\s:\w\+:/hs=s+1
syntax match myCommentLabel /\s@\w\+:/hs=s+1
syntax match myNote /\s@N\(OTE\|ote\):/hs=s+1

syntax keyword cType i8 i16 i32 i64 imm imx
syntax keyword cType s8 s16 s32 s64 smm smx
syntax keyword cType u8 u16 u32 u64 umm umx
syntax keyword cType b8 b16 b32 f32 f64
syntax keyword cType vec2 vec3 vec4 col3 col4 mat2 mat3 mat4 vec2s vec3s vec4s col3s col4s mat2s mat3s mat4s
syntax keyword cStorageClass global internal persist globalv internalf persistv
syntax keyword cConstant True False TRUE FALSE

syntax cluster cCommentGroup add=myTagLabel,myCommentLabel,myNote

highlight myTagLabel guifg=Yellow ctermfg=Yellow ctermbg=18
highlight myCommentLabel guifg=Red ctermfg=Red ctermbg=18
highlight myNote guifg=Green ctermfg=Green ctermbg=18
