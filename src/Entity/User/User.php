<?php

namespace App\Entity\User;

use Doctrine\ORM\Mapping as ORM;
use EasyApiJwtAuthentication\Entity\AbstractExtendedUser;

/**
 * User.
 * @ORM\Entity()
 * @ORM\Table(name="`user`")
 */
class User extends AbstractExtendedUser
{
}
