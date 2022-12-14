function crg = crg_write2file(crg, cur_event, output_folder)
    dt =  datestr(now,'yymmdd_HHMMSS');
    path = sprintf('%s\\%s_%s.crg',output_folder, cur_event.Event, dt);
    t = [datetime('now')];
    DateString = datestr(t);
    string = sprintf('Generated by %s\nWritten by apearson\n\nGenerated by user: %s\nDate: ', mfilename, getenv('USERNAME'));
    ct = append(string,DateString);
    
    crg.ct{1} = ct;
    crg_write(crg, path);
end