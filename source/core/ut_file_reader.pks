create or replace package ut_file_reader is

  function get_all_files(a_directory in varchar2) return t_f_array;
  
  function get_file(a_directory in varchar2, a_file_name in varchar2)
    return varchar2;

end ut_file_reader;
/
