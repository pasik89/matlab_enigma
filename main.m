FLAG = false;
continueWorkFlag = true;

while continueWorkFlag
    while ~FLAG
        actionType = input('\nChcesz zakodować czy odkodować wiadomość? D/E [D]: ', 's');

        if strcmp(actionType, 'D') || strcmp(actionType, 'E') || strcmp(actionType, '')
            FLAG = true;
        else
            disp('\nWybrano nieprawidłową opcję. Wybierz ponownie.')
        end
    end

    if actionType == 'D' || actionType == '' 
        decodeText = input('\nWpisz wiadomość do zakodowania: \n', 's');

        decoded = decode(decodeText);

        clipboard('copy', decoded);

        formattedDecodedMessage = deblank(sprintf('%d ', decoded));

        info = ['Treść zakodowanej wiadomości została skopiowana do schowka: [', formattedDecodedMessage,']. Aby odkodować wiadomość wklej te dane w funkcji odkodowującej.'];

        disp(info);
    elseif actionType == 'E'

        encodeText = input('\nWpisz wiadomość do odkodowania: ');

        encoded = encode(encodeText);

        disp(encoded)
    end

    wantContinue = false;

    while ~wantContinue
        continueWork = input('\nChcesz kontynuować działanie programu i odkodować wiadomość lub zakodować kolejną? T/N: ', 's');

        if strcmp(continueWork, 'T')
            FLAG = false;
            wantContinue = true;
        elseif strcmp(continueWork, 'N')
            continueWorkFlag = false;
            disp('\nDo zobaczenia')
            wantContinue = false;
            return
        else
            disp('\nWpisano niepoprawny znak')
        end
    end
end
