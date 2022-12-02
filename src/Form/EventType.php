<?php

namespace App\Form;

use App\Entity\EventList;

use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;



class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "Event Name"]])
            ->add('start', DateTimeType::class, ["attr" => ["class" => "form-control mb-2"]])
            ->add('description', TextareaType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "A short description"]])
            ->add('capacity', NumberType::class, ["attr" => ["class" => "form-control mb-2"]])
            ->add('email', EmailType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "Contact email"]])
            ->add('phone', NumberType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "Contact phone number"]])
            ->add('street', TextType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "Adress - Streetname + number"]])
            ->add('zip', NumberType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "Adress - ZIP/Postal code"]])
            ->add('city', TextType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "Adress - city name"]])
            ->add('url', UrlType::class, ["attr" => ["class" => "form-control mb-2", "placeholder" => "URL from Event Homepage"]])
            ->add('type', ChoiceType::class, [
                'choices'  => [
                    'music' => "low",
                    'sport' => "normal",
                    'food' => "high",
                    'culture' => "culture"
                ]
            ], ["attr" => ["class" => "form-control mb-2"]])
            ->add('send', SubmitType::class, ["attr" => ["class" => "form-control mb-2"]]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => EventList::class
        ]);
    }
}
