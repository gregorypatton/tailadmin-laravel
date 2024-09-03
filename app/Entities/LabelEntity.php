<?php

namespace App\Entities;

use App\Adapters\ProductComponent;
use App\Enums\ChannelEnum;
use App\Enums\IDTypeEnum;
use Milon\Barcode\DNS1D;

class LabelEntity implements ProductComponent
{
    public ?IDTypeEnum $idType = null;

    public ?int $count = 0;

    public ?string $sku;

    public ?string $title;

    public ?string $sellableId;

    public ?int $gtin;

    public ?string $fnsku;

    public ?array $options;

    public ?string $brand;

    public ?string $defaultLabelTemplate;

    public ?int $prepDetailId;

    public ?ChannelEnum $channel;

    public ?string $packlistId;
    public ?bool $isActive;
    public ?bool $isKit;
    public ?bool $isHideUpc;


    /*
        This is ugly
        Thanks to WFS
    */
    private $customMessageSkus = ['130-0150-1' => 'SEAL WITH TAPE', '130-0100-1' => 'SEAL WITH TAPE'];

    private ?string $customMessage = null;
    public string $barcode;


    protected static array $kitSkus = ['0480-0485-1', '0480-0485-2', '0795-0485-2', '7600-676-2', '7900-676-2', 'NK-210-100-3F', 'NK-310-100-3F', 'NK-311-100-3F', 'NK-312-100-3F', 'TK-1104S-110-5', 'TK-1104SHF-110-5', 'TK-1107SHF-110-5', 'TK-1600-50-110-2', 'TK-16S-1-110-5', 'TK-16S-14-110-5', 'TK-16S-25-110-2', 'TK-16S-4-110-5', 'TK-16S-7-110-5', 'TK-16S-HF-14-110-2', 'TK-16S-HF-25-110-2', 'TK-16S-HF-7-110-5', 'TK-194-110-5', 'TK-2015-110-5', 'TK-2025G-110-2', 'TK-2050-110-2', 'TK-2050G-110-2', 'TK-25-110-2', 'TK-3007-110-5', 'TK-3007G-110-5', 'TK-3015-110-5', 'TK-3015G-110-5', 'TK-3025-110-2', 'TK-3025G-110-2', 'TK-3040-110-2', 'TK-3040G-110-2', 'TK-3050-110-2', 'TK-3050G-110-2', 'TK-35-110-2', 'TK-35-187-110-1F', 'TK-35-194-110-1', 'TK-35-194-110-1F', 'TK-35-550-110-1F', 'TK-35-554-110-1F', 'TK-35-556-110-1F', 'TK-400-110-5', 'TK-55-110-2', 'TK-55-187-110-1', 'TK-55-194-110-1F', 'TK-55-554-110-1F', 'TK-55-556-110-1F', 'TK-556-110-5', 'TK-589-110-2', 'TK-7-110-5', 'TK-HCS4504B-110-5', 'TK-HCS4514-110-5', 'TK-O2U2007C-110-5', 'TK-O2U2012C-110-5', 'TK-OT100-110-5', 'TM-0101-1', 'TM-0101-5', 'TM-0201-1', 'TM-0201-5'];

    protected static array $hideUpcSkus = ['14-3250-40-2', '14-4200-50-1', '14-7031-224-1', '14-7031-224-1B', '34-7021-12-1', '34-7023-12-1', '47360-0172-01-1', '47360-0172-02-1', '92501-1', '92505-1', '94201-1', '94204-1', 'BF1001-1', 'CB-200-DEC', 'CHB-6300-AF', 'CHB-6300-BN', 'CHB-6300-KN', 'CHB-BG5010', 'CHB-EASY-FLEX10', 'CHB-FGC13800-0000', 'CR-100-WB-2', 'LM-900-1', 'NK-210-100-3F', 'NK-310-100-3F', 'NK-311-100-3F', 'NK-312-100-3F', 'OC-0100-5', 'OC-0200-5', 'OC-0300-5', 'OC-0400-5', 'OC-0452-5', 'OC-0454-5', 'OC-0457-5', 'OC-0464-5', 'OC-0475-5', 'OC-0500-5', 'OC-0557-5', 'OC-0600-5', 'OC-0657-5', 'OC-0702-5', 'OC-0704-5', 'OC-0707-5', 'OC-0714-5', 'OC-0725-5', 'OM-0100-5', 'OM-0150-5', 'OM-0200-5', 'OM-0250-5', 'OM-0300-5', 'OM-0400-5', 'OM-0500-5', 'OM-0550-5', 'OM-0600-5', 'OM-0650-5', 'OT-0100-5', 'OT-C007-5', 'OT-C014-5', 'OT-C025-5', 'OT-C050-5', 'OT-G014-5', 'OT-G025-5', 'OT-G050-5', 'OT-P007-5', 'OT-P014-5', 'OT-P025-5', 'OT-P050-5', 'RES020-5', 'RES037T-5', 'RES1007V-5', 'RES1104-5', 'RES1104S-5', 'RES1104SHF-5', 'RES1107-5', 'RES1107SHF-5', 'RES3007G-5', 'RES3015G-5', 'RES3025-5', 'RES3025G-5', 'RES3040G-5', 'RES3050G-5', 'TK-1104S-110-5', 'TK-1104SHF-110-5', 'TK-1107SHF-110-5', 'TK-1600-50-110-2', 'TK-16S-1-110-5', 'TK-16S-14-110-5', 'TK-16S-25-110-2', 'TK-16S-4-110-5', 'TK-16S-7-110-5', 'TK-16S-HF-14-110-2', 'TK-16S-HF-25-110-2', 'TK-16S-HF-7-110-5', 'TK-194-110-5', 'TK-2015-110-5', 'TK-2025G-110-2', 'TK-2050-110-2', 'TK-2050G-110-2', 'TK-25-110-2', 'TK-3007-110-5', 'TK-3007G-110-5', 'TK-3015-110-5', 'TK-3015G-110-5', 'TK-3025-110-2', 'TK-3025G-110-2', 'TK-3040-110-2', 'TK-3040G-110-2', 'TK-3050-110-2', 'TK-3050G-110-2', 'TK-35-110-2', 'TK-400-110-5', 'TK-55-110-2', 'TK-556-110-5', 'TK-589-110-2', 'TK-7-110-5', 'TK-HCS4504B-110-5', 'TK-HCS4514-110-5', 'TK-O2U2007C-110-5', 'TK-O2U2012C-110-5', 'TK-OT100-110-5', 'TM-0100-5', 'TM-0101-5', 'TM-0200-5', 'TM-0201-5', 'TUB0018-1', 'TUB06-1', 'TUB06-1F', 'TUB06-3'];

    protected static array $activeSkus = ['0101-1', '0101-5', '0106-1', '0106-5', '0137-1', '0137-5', '0137-50', '0210-1', '0210-1S', '0210-50', '0360-1', '0360-5', '0361-1', '0361-5', '0370-1', '0370-5', '0371-1', '0375-1', '0375-2', '0380-1', '0409-5', '0409-50', '0470-1', '0480-0485-1', '0480-0485-2', '0480-1', '0480-5', '0485-1', '0485-5', '0485-50', '0556-1', '0556-10', '0556-5', '0556-50', '0556-5A', '0568-1', '0589-1', '0589-5', '0795-0485-2', '0795-1', '0795-5', '1016-0-10', '1016-0-2', '1016-0-5', '1016-0-50', '120-1000C-CONV', '120-1010C', '120-1030C', '120-1031C', '120-1040C', '120-1060C', '120-1061C', '120-1070C-CONV', '120-1200', '120-1205', '120-1210', '120-1230', '120-1260', '120-1270MRI', '120-2050', '120-3030', '120-3031', '120-3040F', '120-3060', '120-3061', '1220-0-1A', '1220-0-1F', '1220-0-2', '1220-0-25', '1220-0-3', '1220-0-4', '1225-0-1', '1225-0-1B', '1249C-0-1', '1249C-0-1B', '1249C-0-5', '130-0100-1', '130-0150-1', '14-3250-40-1', '14-3250-40-2', '14-4200-50-1', '14-7031-224-1', '14-7031-224-12', '14-7031-224-1B', '150-0100', '150-0102', '150-0110', '150-0113', '150-0115', '150-0240', '150-0261F', '150-0262', '150-0265', '150-1100', '150-1101', '150-1121F', '150-1151', '150-1153', '1600HF-14-1', '1600HF-25-1', '1600HF-4-1', '1600HF-4-1B', '1600HF-4-25', '1600HF-50-1', '1600HF-7-1', '1600HF-7-1B', '1600HF-7-25', '16SOFT-1-1', '16SOFT-14-1', '16SOFT-14-2', '16SOFT-1-50', '16SOFT-25-1', '16SOFT-4-1', '16SOFT-4-10', '16SOFT-4-5', '16SOFT-7-5', '16SOFT-HF-14-1', '16SOFT-HF-25-1F', '16SOFT-HF-7-1F', '16SOFT-HF-7-25', '16SOFT-INF-7-1', '16SOFT-INF-7-50', '16SOFT-PED-7-1', '16SOFT-PED-7-50', '16SOFTTG-7-1', '16SOFTTG-7-50', '180-4205-5', '180-4215-10', '180-4215-5', '180-5004', '180-5005', '180-5006F', '200-0122-25', '200-0122-5', '200-0150-1', '200-0150-5', '200-0160-1', '200-0160-5', '200-0172-5', '200-0175-1', '200-0175-5F', '200-0177-1F', '200-0177-5', '200-0180-1', '2002-7-20F', '2002-7-50', '2014-14-1', '2025-25-1', '2025G-25-1', '2050-50-1', '220-1570-5', '220-1571-1', '34-7021-12-1', '34-7023-12-1', '47360-0172-01-1', '47360-0172-02-1', '7001-0-1', '7001-0-25', '7001-0-5', '7600-0-1', '7600-676-2', '7900-0-1', '7900-676-2', '8660-7-1', '92501-1', '92505-1', '94201-1', '94204-1', '9996-1-1', '9996-1-25', '9996-1-5', 'BF1001-1', 'CHB-6300-AF', 'CHB-6300-BN', 'CHB-6300-KN', 'CHB-BG5010', 'CHB-EASY-FLEX10', 'CHB-FGC13800-0000', 'NK-210-100-3F', 'NK-310-100-3F', 'NK-311-100-3F', 'NK-312-100-3F', 'O2U2007C-5', 'OC-0100-5', 'OC-0200-5', 'OC-0300-100', 'OC-0300-5', 'OC-0400-100', 'OC-0400-5', 'OC-0452-100', 'OC-0452-5', 'OC-0454-1', 'OC-0454-100', 'OC-0454-5', 'OC-0457-5', 'OC-0464-5', 'OC-0475-5', 'OC-0500-100', 'OC-0500-5', 'OC-0557-5', 'OC-0600-100', 'OC-0600-5', 'OC-0657-5', 'OC-0702-100', 'OC-0702-5', 'OC-0704-100', 'OC-0704-5', 'OC-0707-5', 'OC-0714-5', 'OC-0725-5', 'OC-16S-0-10', 'OM-0100-5', 'OM-0150-5', 'OM-0200-5', 'OM-0250-5', 'OM-0300-5', 'OM-0400-5', 'OM-0500-5', 'OM-0550-5', 'OM-0600-5', 'OM-0650-5', 'OT-0100-5', 'OT-C007-5', 'OT-C014-5', 'OT-C025-5', 'OT-C050-5', 'OT-G014-5', 'OT-G025-5', 'OT-G050-5', 'OT-P007-5', 'OT-P014-5', 'OT-P025-5', 'OT-P050-5', 'RES010-1', 'RES010KIT-1', 'RES020-5', 'RES037-1', 'RES037T-1', 'RES037T-5', 'RES1007V-1', 'RES1007V-5', 'RES1104-5', 'RES1104S-5', 'RES1104SHF-1', 'RES1104SHF-5', 'RES1107-5', 'RES1107SHF-1', 'RES1107SHF-1F', 'RES1107SHF-5', 'RES3007-1', 'RES3007-5', 'RES3007G-1', 'RES3007G-1F', 'RES3007G-5', 'RES3015-1', 'RES3015-5', 'RES3015G-1', 'RES3015G-5', 'RES3025-1', 'RES3025-5', 'RES3025G-1', 'RES3025G-5', 'RES3040-1', 'RES3040G-1', 'RES3040G-5', 'RES3050G-1', 'RES3050G-5', 'SO-676-1', 'SO-676-1A', 'SO-676-5', 'TK-1104S-110-5', 'TK-1104SHF-110-5', 'TK-1107SHF-110-5', 'TK-1600-50-110-2', 'TK-16S-1-110-5', 'TK-16S-14-110-5', 'TK-16S-25-110-2', 'TK-16S-4-110-5', 'TK-16S-7-110-5', 'TK-16S-HF-14-110-2', 'TK-16S-HF-25-110-2', 'TK-16S-HF-7-110-5', 'TK-194-110-5', 'TK-2015-110-5', 'TK-2025G-110-2', 'TK-2050-110-2', 'TK-2050G-110-2', 'TK-25-110-2', 'TK-3007-110-5', 'TK-3007G-110-5', 'TK-3015-110-5', 'TK-3015G-110-5', 'TK-3025-110-2', 'TK-3025G-110-2', 'TK-3040-110-2', 'TK-3040G-110-2', 'TK-3050-110-2', 'TK-3050G-110-2', 'TK-35-110-2', 'TK-35-187-110-1F', 'TK-35-194-110-1', 'TK-35-194-110-1F', 'TK-35-550-110-1F', 'TK-35-554-110-1F', 'TK-35-556-110-1F', 'TK-400-110-5', 'TK-55-110-2', 'TK-55-187-110-1', 'TK-55-194-110-1F', 'TK-55-554-110-1F', 'TK-55-556-110-1F', 'TK-556-110-5', 'TK-589-110-2', 'TK-7-110-5', 'TK-HCS4504B-110-5', 'TK-HCS4514-110-5', 'TK-O2U2007C-110-5', 'TK-O2U2012C-110-5', 'TK-OT100-110-5', 'TM-0100-5', 'TM-0101-5', 'TM-0200-5', 'TM-0201-5', 'TUB0018-1', 'TUB010-1', 'TUB06-1', 'TUB06-1F', 'TUB06-3'];

    public function __construct(
        ChannelEnum $channel,
        ?string $sku,
        ?int $count,
        ?string $title,
        ?string $sellableId,
        ?int $gtin,
        ?string $fnsku,
        ?string $brand,
        ?array $options,
        ?IDTypeEnum $idType,
        ?string $defaultLabelTemplate = null,
        ?string $prepDetailId = null,
        ?string $packlistId = null
    ) {
        $this->sku = $sku;
        $this->title = $title;
        $this->sellableId = $sellableId;
        $this->gtin = $gtin;
        $this->channel = $channel;
        $this->idType = $idType;
        $this->count = $count;
        $this->fnsku = $fnsku;
        $this->brand = $brand;
        $this->defaultLabelTemplate = $defaultLabelTemplate;
        $this->prepDetailId = $prepDetailId;
        $this->packlistId = $packlistId;
        $this->options = $options;
        $this->isKit = $this->isKit();
        $this->isHideUpc = $this->isHideUpc();
        $this->isActive = $this->isActive();
        $this->barcode = $this->barcode(2, 30);
        $this->idType = IDTypeEnum::FNSKU;

        if (isset(self::$customMessageSkus[$sku])) {
            $this->customMessage = self::$customMessageSkus[$sku];
        }
    }

    public function isKit(): bool
    {
        return in_array($this->sku, self::$kitSkus, true);
    }

    public function isHideUpc(): bool
    {
        return in_array($this->sku, self::$hideUpcSkus, true);
    }

    public function isActive(): bool
    {
        return in_array($this->sku, self::$activeSkus, true);
    }

    public function getCustomMessage(): ?string
    {
        return $this->customMessage;
    }

    public function toArray(): array
    {
        return [
            'sku' => $this->sku,
            'title' => $this->title,
            'sellableId' => $this->sellableId,
            'gtin' => $this->gtin,
            'fnsku' => $this->fnsku,
            'brand' => $this->brand,
            'idType' => $this->idType->value,
            'count' => $this->count,
            'customMessage' => $this->getCustomMessage(),
            'isKit' => $this->isKit(),
            'isHideUpc' => $this->isHideUpc(),
            'isActive' => $this->isActive(),
            // Add any other relevant fields
        ];
    }

    // Implementing ProductComponent methods

    public function getSku(): string
    {
        return $this->sku;
    }
    public function barcode($width, $height): string
    {
        $format = 'C128A';
        switch ($this->getIdType()) {
            case IDTypeEnum::ASIN || IDTypeEnum::FNSKU:
                $format = 'C128A';
                return '<img src="data:image/png;base64,' . (new DNS1D())->getBarcodePNG($this->sellableId, $format, $width, $height) . '" alt="barcode"   />';
                break;
            case IDTypeEnum::UPC:
                $format = 'UPCA';
                return '<img src="data:image/png;base64,' . (new DNS1D())->getBarcodePNG($this->sellableId, $format, $width, $height) . '" alt="barcode"   />';
                break;

            case IDTypeEnum::UNKNOWN:
            default:
                return '<span style="width:100%; height:10%; display:block;">BARCODE ERROR</span>';
                break;
        }
    }

    public function getTitle(): string
    {
        return $this->title;
    }

    public function getCount(): int
    {
        return $this->count;
    }

    public function getsellableId(): string
    {
        return $this->sellableId;
    }

    public function getIdType(): IDTypeEnum
    {
        return $this->idType;
    }

    public function getChannel(): ?ChannelEnum
    {
        return $this->channel;
    }

    public function getGtin(): ?int
    {
        return $this->gtin;
    }
    public function getBrand(): ?string
    {
        return $this->brand;
    }
    public function getFnsku(): ?string
    {
        return $this->fnsku;
    }
}
