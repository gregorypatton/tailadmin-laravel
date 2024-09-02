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
            self::FNSKU => 'C128',
            self::UNKNOWN => 'UNKNOWN', // Default or unrecognized format
        };
    }

    public static function fromString(string $value): self
    {
        return match (strtolower($value)) {
            'upc' => self::UPC,
            'fnsku' => self::FNSKU,
            default => self::UNKNOWN,
        };
    }
}
