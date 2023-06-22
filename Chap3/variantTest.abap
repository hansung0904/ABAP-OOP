* 데이터 선언
DATA: gt_filter TYPE lvc_t_filt,
      ls_filter TYPE lvc_s_filt.

* value 적용
ls_filter-fieldname = 'TENURE'.
ls_filter-sign = 'I'.
ls_filter-option = 'BT'.
ls_filter-low = '20'.
ls_filter-high = '30'.
APPEND ls_filter TO gt_filter.

* Exporting 값
IT_FILTER = gt_filter.