<?php

namespace App\Repositories;

use App\Base64ToPng;

class Base64ToPngRepository extends BaseRepository
{

    public function __construct(Base64ToPng $base64ToPng)
    {
        parent::__construct($base64ToPng);

    }

    public function update($id, array $args)
    { 
        $base64ToPng = $this->find($id);
        parent::update($id, $args);

        return $base64ToPng;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

}



