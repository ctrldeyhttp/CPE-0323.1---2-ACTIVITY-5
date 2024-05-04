.model small
.stack 100h
.data
    statusRegister db 06h  ; Example status: Power ON, not ready, error present

.code
main proc
    ; Load the status register into AL
    mov al, statusRegister

    ; Check if Power is ON and Device is ready and no Error
    ; Power ON: Bit 0 (mask 00000001)
    ; Device Ready: Bit 1 (mask 00000010)
    ; No Error: Bit 2 needs to be 0 (mask 00000100)

    ; Prepare the mask for checking power ON and ready
    mov bl, 03h  ; Mask for Power ON and Device Ready
    test al, bl
    jnz DeviceNotReadyOrOff  ; Jump if not both bits are set

    ; Check for no error
    test al, 04h  ; Test the Error bit
    jz NoError  ; If zero, no error present

DeviceNotReadyOrOff:
    ; Print message: Device not ready or power off
    mov dx, offset NotReadyMsg
    jmp PrintMessage

NoError:
    ; Print message: Device operational
    mov dx, offset OperationalMsg

PrintMessage:
    mov ah, 09h
    int 21h

    ; End of program
    mov ax, 4C00h
    int 21h

NotReadyMsg db 'Device not ready or power off.$'
OperationalMsg db 'Device operational and no errors.$'
main endp
end main
