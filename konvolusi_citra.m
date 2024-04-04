function hasil_konvolusi = konvolusi_citra(citra, mask)
    % Mendapatkan dimensi citra dan mask
    [tinggi_citra, lebar_citra] = size(citra);
    [tinggi_mask, lebar_mask] = size(mask);

    % Memastikan mask berukuran ganjil
    if mod(tinggi_mask, 2) == 0 || mod(lebar_mask, 2) == 0
        error('Ukuran mask harus ganjil.');
    end

    % Menentukan ukuran padding untuk menjaga dimensi citra
    padding = (tinggi_mask - 1) / 2;

    % Padding citra dengan nilai 0
    citra_padding = padarray(citra, [padding padding], 'replicate');

    % Menginisialisasi hasil konvolusi
    hasil_konvolusi = zeros(tinggi_citra, lebar_citra);

    % Melakukan konvolusi untuk setiap piksel di citra
    for i = 1:tinggi_citra
        for j = 1:lebar_citra
            % Mengambil sub-citra di sekitar piksel (i, j)
            sub_citra = citra_padding(i:i+tinggi_mask-1, j:j+lebar_mask-1);

            % Menghitung konvolusi untuk piksel (i, j)
            hasil_konvolusi(i, j) = sum(sum(double(sub_citra) .* mask));
        end
    end
    
    % Mengembalikan hasil konvolusi
    return;
end
