DefinitionBlock ("DSDT.aml", "DSDT", 2, "QCOMM ", "SDM845 ", 3)
{
    Scope (\_SB)
    {
        Device (CPU0)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 0)

            Method (_STA, 0, NotSerialized) { Return (0x0F) }
        }

        Device (CPU1)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 1)

            Method (_STA, 0, NotSerialized) { Return (0x0F) }
        }

        Device (CPU2)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 2)

            Method (_STA, 0, NotSerialized) { Return (0x0F) }
        }

        Device (CPU3)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 3)

            Method (_STA, 0, NotSerialized) { Return (0x0F) }
        }

        Device (CPU4)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 4)

            Method (_STA, 0, NotSerialized) { Return (0x0F) }
        }

        Device (CPU5)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 5)

            Method (_STA, 0, NotSerialized) { Return (0x0F) }
        }

        Device (CPU6)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 6)

            Method (_STA, 0, NotSerialized) { Return (0x0F) }
        }

        Device (CPU7)
        {
            Name (_HID, "ACPI0007")
            Name (_UID, 7)

            Method (_STA, 0, NotSerialized) { Return (0x0F) }
        }

        // Primary USB controller (DWC3), behind the USB role switch
        Device (URS0)
        {
            Name (_HID, "QCOM0304")
            Name (_CID, "PNP0CA1")
            Name (_UID, 0)
            Name (_CCA, 0)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x0A600000, 0x000FFFFF)
            })

            Method (_STA, 0, NotSerialized) { Return (0x0F) }

            // Host role
            Device (USB0)
            {
                Name (_ADR, 0)
                Name (_S0W, 3)

                // Connectable USB Type-C port with a switch
                Name (_UPC, Package (4) { 1, 0x09, 0, 0 })

                // DWC3 core interrupt, SPI 133
                Name (_CRS, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, , , ) { 0xA5 }
                })

                Method (_STA, 0, NotSerialized) { Return (0x0F) }

                // QUSB2 board tuning: TUNE1 (HSTX trim 21.6 mA, 5% preemphasis, half bit width), IMP_CTRL1 offset 8
                Method (PHYC, 0, NotSerialized)
                {
                    Return (Package ()
                    {
                        Package (3) { 0, 0x088E2240, 0x45 },
                        Package (3) { 0, 0x088E2220, 0x08 }
                    })
                }
            }
        }
    }
}
