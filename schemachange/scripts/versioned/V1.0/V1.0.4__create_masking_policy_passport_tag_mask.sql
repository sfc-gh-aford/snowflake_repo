create masking policy common.security_objects.passport_tag_mask
as (val string) returns string ->
  case
    when system$get_tag_on_current_column('common.security_objects.passport_tag') = 'visible' THEN val
    else '***MASKED***'
  end;

alter tag common.security_objects.passport_tag set masking policy common.security_objects.passport_tag_mask;