function [cur_event crg_event_split] = gen_param_struct(crg_full, param_table, i)
    cur_event = table2struct(param_table(i,:),"ToScalar",true);
    cur_event.Event = char(cur_event.Event);
    cur_event.u = str2num(cell2mat(cur_event.u));
    cur_event.v = str2num(cell2mat(cur_event.v));
    crg_event_split = crg_cut_iuiv(crg_full,cur_event.u , cur_event.v);
    cur_event.sv =   crg_event_split.v;
end