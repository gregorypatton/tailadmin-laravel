<?php

namespace App\Enums;

enum IDTypeEnum: string
{
    case ASIN = 'ASIN';
    case UPC = 'UPC';
    case FNSKU = 'FNSKU';
    case UNKNOWN = 'UNKNOWN';

    // Method to get the corresponding barcode format for each ID type
    public function getBarcodeFormat(): string
    {
        return match ($this) {
            self::UPC => 'UPC',
            self::FNSKU => 'C128A',
            self::UNKNOWN => '', // Default or unrecognized format
        };
    }

    public static function fromString(string $value): self
    {
        return match (strtolower($value)) {
            'upc' => self::UPC,
            'fnsku' => self::FNSKU,
            'asin' => self::FNSKU, // Looks bad, but ASIN will always be FNSKU on the barcode side. For now, we have no need for the ASIN.
            'ean' => self::UPC, // EAN and UPC are subsets of GTIN
            default => self::UNKNOWN,
        };
    }
}
