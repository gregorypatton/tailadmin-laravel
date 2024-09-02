<?php

namespace App\Enums;

enum ChannelEnum: string
{
    case Amazon = 'Amazon';
    case Walmart = 'Walmart';
    case Shop = 'Shop';
    case Unknown = 'Unknown';

    // Static method to create an enum instance from a string
    public static function fromString(string $value): self
    {
        return match (strtolower($value)) {
            'amazon' => self::Amazon,
            'walmart' => self::Walmart,
            'shop' => self::Shop,
            default => self::Unknown,
        };
    }
}
