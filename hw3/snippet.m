[~,N] = size(data.inputs);
wdpart.input_to_hid = model.input_to_hid * wd_coefficient;
wdpart.hid_to_class = model.hid_to_class * wd_coefficient;

dEd_class_input = (class_prob - data.targets) / N;
dEd_hid_output = model.hid_to_class' * dEd_class_input;
dEd_hid_input = hid_output .* (1 - hid_output) .* dEd_hid_output;

classpart.hid_to_class = dEd_class_input * hid_output';
classpart.input_to_hid = dEd_hid_input * data.inputs';

res.input_to_hid = classpart.input_to_hid + wdpart.input_to_hid;
res.hid_to_class = classpart.hid_to_class + wdpart.hid_to_class;
