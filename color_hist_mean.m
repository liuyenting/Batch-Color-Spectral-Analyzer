function out = color_hist_mean(I)

% Probing for color channels.
[~, ~, n_ch] = size(I);

out = zeros(1, n_ch);
parfor i = 1:3
    % Pick out specific color channel.
    I_t = I(:,:,i);
    [cnts, bin_loc] = imhist(I_t);
    out(i) = sum(cnts .* bin_loc) / sum(cnts);
end

end