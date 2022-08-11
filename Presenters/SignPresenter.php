<?php

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use App\Model\DataEarning;
use Nette\Application\UI\Form;

final class SignPresenter extends Nette\Application\UI\Presenter
{
    private DataEarning $earnedData;
    private Nette\Database\Explorer $database;

    public function __construct(DataEarning $earnedData, Nette\Database\Explorer $database)
    {
        $this->earnedData = $earnedData;
        $this->database = $database;
    }

    public function renderIn(): void
    {
        $this->template->posts = $this->earnedData
            ->getData()
            ->limit(5);

        $this->template->allPosts = $this->database
            ->table('pages');
    }

    public function actionOut(): void
    {
        $this->getUser()->logout();
        $this->redirect('Homepage:');
    }

    protected function createComponentSignInForm(): Form
    {
        $form = new Form;
        $form->addText('username', 'Uživatelské jméno:')
            ->setRequired('Prosím vyplňte své uživatelské jméno.');

        $form->addPassword('password', 'Heslo:')
            ->setRequired('Prosím vyplňte své heslo.');

        $form->addSubmit('send', 'Přihlásit');

        $form->onSuccess[] = [$this, 'signInFormSucceeded'];
        return $form;
    }

    public function signInFormSucceeded(Form $form, \stdClass $data): void
    {
        try {
            $this->getUser()->login($data->username, $data->password);
            $this->redirect('Homepage:');

        } catch (Nette\Security\AuthenticationException $e) {
            $form->addError('Nesprávné přihlašovací jméno nebo heslo.');
        }
    }
}
