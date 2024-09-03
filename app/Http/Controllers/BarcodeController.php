<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Milon\Barcode\DNS1D;

class BarcodeController extends Controller
{
    public function create(Request $request)
    {
        // Validate the incoming request
        $validated = $request->validate([
            'type' => 'required|string|in:UPCA,C128,EAN13', // Add other types as needed
            'identifier' => 'required|string|max:100',
            'width' => 'nullable|integer|min:2|max:8',
            'height' => 'nullable|integer|min:15|max:45',
        ]);

        // Generate the barcode SVG
        $barcode = new DNS1D();
        $svg = $barcode->getBarcodeSVG($validated['identifier'], $validated['type'], $validated['width'] ?? 2, $validated['height'] ?? 100, 'black', false);

        // Return the SVG content
        return response($svg, 200)->header('Content-Type', 'image/svg+xml');
    }
}
