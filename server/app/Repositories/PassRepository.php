<?php


namespace App\Repositories;

use App\Pass;

class PassRepository extends BaseRepository
{

    public function __construct(Pass $pass)
    {
        parent::__construct($pass);

    }

    public function update($id, array $args)
    {
        $pass = $this->find($id);
        parent::update($id, $args);

        return $pass;
    }

    public function insert(array $attributes)
    {
        return parent::insert($attributes);
    }

//     public function destroy($id)
//     {
// //              $ids = explode(',',$id);
// //
// //             foreach ($ids as $id)
// //             {
// //
// //                 $pass = $this->find($id);
// //
// //                 if(!$pass)
// //                 {
// //                     return false;
// //                 };
// //
// //                 $pass->destroy();
// //             }
// //
// //             return true;
//
//            parent::destroy($id);
//
//     }

}
