create or replace package body ut_file_reader is
  
  function get_all_files(a_directory in varchar2) return t_f_array as
    language java name 'FileReading.getFileList(java.lang.String) return oracle.sql.ARRAY';
  
  function get_file(a_directory in varchar2, a_file_name in varchar2)
    return varchar2 as
    language java name 'FileReading.existFile(java.lang.String, java.lang.String) return java.lang.String';

end ut_file_reader;
/
