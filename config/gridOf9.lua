if (get_window_class()=="Skype") then
	set_window_workspace(8);
	maximize_vertically();
end
if (get_window_name()=="Transmission") then
	set_window_workspace(7);
	shade();
end
if (string.find(get_window_name(), "Sublime Text")) then
	set_window_workspace(5);
	maximize();
end

