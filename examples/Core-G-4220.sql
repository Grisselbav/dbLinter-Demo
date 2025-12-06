-- Core G-4220: Try to use CASE rather than DECODE.

select decode(ctry.country_code, constants_up.co_ctry_uk, constants_up.co_lang_english
                               , constants_up.co_ctry_fr, constants_up.co_lang_french
                               , constants_up.co_ctry_de, constants_up.co_lang_german
                                                        , constants_up.co_lang_not_supported)
  from countries ctry;
