FLAG = false;
continueWorkFlag = true;

while continueWorkFlag
    while ~FLAG
        actionType = input('Chcesz zakodować czy odkodować wiadomość? D/E [D]: ', 's');

        if strcmp(actionType, 'D') || strcmp(actionType, 'E') || strcmp(actionType, '')
            FLAG = true;
        else
            disp('Wybrano nieprawidłową opcję. Wybierz ponownie.')
        end

        if strcmp(continueWork, 'T')
            continueWorkFlag = true;
            continue
        end
    end

    if actionType == 'D'
        decodeText = input('Wpisz wiadomość do zakodowania: \n', 's');

        decoded = decode(decodeText);

        clipboard('copy', decoded);

        formattedDecodedMessage = deblank(sprintf('%d ', decoded));

        info = ['Treść zakodowanej wiadomości została skopiowana do schowka: [', formattedDecodedMessage,']. Aby odkodować wiadomość wklej te dane w funkcji odkodowującej.'];

        disp(info);

        continueWorkFlag = true;
    elseif actionType == 'E'

        encodeText = input('Wpisz wiadomość do odkodowania: ');

        encoded = encode(encodeText);

        disp(encoded)

        continueWorkFlag = true;
    end

    continueWork = input('Chcesz kontynuować działanie programu i odkodować wiadomość lub zakodować kolejną? T/N: ', 's');

    if strcmp(continueWork, 'T')
        FLAG = false;
    elseif strcmp(continueWork, 'N')
        continueWorkFlag = false;
        disp('Do zobaczenia')
        return
    else
        disp('Wpisano niepoprawny znak')
    end
end
