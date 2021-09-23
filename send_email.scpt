on run argv

    set emailSender to "from@mail.com"

    set theSubject to "You have received new mail!"

    set theContent to "Hi, here is your attachment: \n\n\n\n"

    tell application "Finder"
        set folderPath to folder "Macintosh HD:Users:{username}:mail_sender:mail_test:"
        set theFile to first file in folderPath as alias
        set fileName to name of theFile
    end tell
    set theAttachment to theFile

    tell application "Mail"
        set newMessage to make new outgoing message with properties {sender:emailSender, subject:theSubject, content:theContent, visible:true}
        tell newMessage
            make new to recipient at end of to recipients with properties {address:(item 1 of argv)}
        try
                make new attachment with properties {file name:theAttachment} at after the last word of the last paragraph
                set message_attachment to 0
            on error errmess -- oops
                log errmess -- log the error
                set message_attachment to 1
            end try
            delay 10
            send
        end tell
    end tell
end run