<?php

namespace core;

class View
{
    public function generate($content_file, $template_file, $data = Null)
    {
        require_once 'view/templates/' . $template_file;
    }
}